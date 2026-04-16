#include "c74_min.h"
#include "Eigen/Dense"
#include <algorithm>

using namespace c74::min;
using namespace Eigen;

class solver : public object<solver> {
public:
    MIN_DESCRIPTION{ "A solver for a particular system of equations related to the synthesis of Auditory Distortion Products. Such equation was first proposed in \"Kendall, G.S., Haworth, C., and Cadiz, R.F. (2014). Sound Synthesis with Auditory Distortion Products. Computer Music Journal 38(4)\"." };
    MIN_TAGS{ "math, operators" };
    MIN_AUTHOR{ "Gutierrez, E and Cadiz, R." };
    //MIN_RELATED{ "jit.convolve" };

    inlet<>  input{ this, "(list) list containing the target distribution of amplitudes." };
    outlet<> output1{ this, "(list) list containing the amplitudes of the carrier complex of pure tones." };
    outlet<> output2{ this, "(float) l^2 error of the estimation." };

    //Preamble
    //S is the left shift function. For example, S(1,2,3)=(2,3,0)
    VectorXd S(VectorXd X) {
        int N = X.rows();
        VectorXd shifted = MatrixXd::Zero(N, 1);
        for (int i = 0; i < N - 1; i++) {
            shifted(i) = X(i + 1);
        }
        shifted(N - 1) = 0;
        return shifted;
    }

    //R is the right shift function. For example, S(1,2,3)=(0,1,2)
    VectorXd R(VectorXd X) {
        int N = X.rows();
        VectorXd shifted = MatrixXd::Zero(N, 1);
        for (int i = 0; i < N - 1; i++) {
            shifted(i + 1) = X(i);
        }
        shifted(0) = 0;
        return shifted;
    }

    //SN(X,n) applies S n times to the vector X
    VectorXd SN(VectorXd X, int N) {
        VectorXd nshifted = X;
        for (int i = 0; i < N; i++) {
            nshifted = S(nshifted);
        }
        return nshifted;
    }

    //RN(X,n) applies R n times to the vector X
    VectorXd RN(VectorXd X, int N) {
        VectorXd nshifted = X;
        for (int i = 0; i < N; i++) {
            nshifted = R(nshifted);
        }
        return nshifted;
    }

    //The function A generates the right part of the equation (17) in the paper considering A_1=1. For example,
    //A(2,3,4)=( 1*2 + 2*3 + 3*4
    //           1*3 + 2*4
    //           1*4             )
    //A:R^N -> R^N, where N+1 is the number of sinusoids and N is the number of target harmonics.
    VectorXd A(VectorXd X) {
        int N = X.rows();
        VectorXd Y = MatrixXd::Zero(N + 1, 1);
        Y(0) = 1;
        for (int i = 1; i < N + 1; i++) {
            Y(i) = X(i - 1);
        }
        VectorXd Z = MatrixXd::Zero(N, 1);
        for (int i = 0; i < N; i++) {
            Z(i) = Y.dot(SN(Y, i + 1));
        }
        return Z;
    }

    //The function F is the system (17) equals 0 again with A_1=1.
    VectorXd F(VectorXd X, VectorXd T) {
        VectorXd Y = A(X) - T;
        return Y;
    }

    //The Jacobian matrix is defined
    MatrixXd DF(VectorXd X) {
        int N = X.rows();
        MatrixXd Z = MatrixXd::Zero(N, N);
        VectorXd temp;
        for (int i = 0; i < N - 1; i++) {
            temp = SN(X, i + 1) + RN(X, i + 1);
            for (int j = 0; j < N; j++) {
                Z(i, j) = temp(j);
            };
        }
        Z = Z + MatrixXd::Identity(N, N);
        return Z;
    }

    message<> list{ this, "list", "Input to the convolution function.",
    MIN_FUNCTION {
            //n is defined as the amount of harmonics needed and it is capped to 16
            int n = args.size();
            n = std::min(n, 16);
            //T is defined as the vector of amplitudes of the target to synthesize
            //Init_T is defined for comparison with the final result
            VectorXd init_T(n);
            for (int i = 0; i < n; ++i) {
                init_T(i) = args[i];
            }
            VectorXd T(n);
            for (int i = 0; i < n; ++i) {
                T(i) = args[i];
            }

            //The first guess is defined at random(0,1).
            VectorXd X(n);
            VectorXd Random;
            VectorXd UNO(n);
            for (int i = 0; i < n; i++) {
                UNO(i) = 1;
            }
            Random = MatrixXd::Random(n, 1);
            X = 0.5 * (Random + UNO);

            //A temporal solution vector is made for comparison
            VectorXd temporal_solution(n);
            for (int i = 0; i < n; ++i) {
                temporal_solution(i) = 0.5;
            }

            //The Newthon method is set.
            //Tolerance = amount of iterations until it restarts with new parameters.
            //succes = 0 if fail and 1 if the method converged.
            //escape = 0 if it is not necessary to leave yet and 1 when it is making MAX freeze.
            int tolerance = 33;
            int success = 0;
            int escape = 0;
            int j = 0;
            while (success == 0 && escape == 0) {
                int i = 0;
                j = j + 1;
                while (F(X, T).dot(F(X, T)) > 0.0001 && i < tolerance) {
                    i = i + 1;
                    X = DF(X).colPivHouseholderQr().solve(DF(X) * X - F(X, T));
                }

                //This part is made to save the best option between the current one and the last one
                if (F(X, init_T).dot(F(X, init_T)) < F(temporal_solution, init_T).dot(F(temporal_solution, init_T))) {
                    for (int i = 0; i < n; ++i) {
                        temporal_solution(i) = X(i);
                    }
                }

                if (F(X, T).dot(F(X, T)) <= 0.0001) {
                    //success = 1 means we won
                    success = 1;
                    escape = 0;
                }
                else {
                    if (j > 100) {
                        success = 0;
                        escape = 1;
                    }
                    else {
                        success = 0;
                        escape = 0;
                        //It's time to redefine the target adding an error and changing the initial condition X.
                        VectorXd Random_for_initial;
                        VectorXd Random_for_target;
                        Random_for_initial = MatrixXd::Random(n, 1);
                        Random_for_target = MatrixXd::Random(n, 1);
                        T = init_T + 0.01 * Random_for_target;
                        X = 0.5 * (UNO + Random_for_initial);
                    }
                }
            }

            //A second try to approximate the solution adding errors is made when the first approach failed.
            if (success == 0) {
                //First the initial condition and the target are redefined
                Random = MatrixXd::Random(n, 1);
                X = 0.5 * (Random + UNO);
                for (int i = 0; i < n; ++i) {
                    T(i) = args[i];
                }

                int success_2 = 0;
                int j = 0;
                while (success_2 == 0 && j < 100) {
                    int i = 0;
                    j = j + 1;
                    while (F(X, T).dot(F(X, T)) > 0.0001 && i < tolerance) {
                        i = i + 1;
                        X = DF(X).colPivHouseholderQr().solve(DF(X) * X - F(X, T));
                    }

                    //This part is made to save the best option between the current one and the last one
                    if (F(X, init_T).dot(F(X, init_T)) < F(temporal_solution, init_T).dot(F(temporal_solution, init_T))) {
                        for (int i = 0; i < n; ++i) {
                            temporal_solution(i) = X(i);
                        }
                    }

                    //Let's leave if we get to a solution and restart in case we did not get there.
                    if (F(X, T).dot(F(X, T)) <= 0.0001) {
                        //success = 1 means we won
                        success_2 = 1;
                    }
                    else {
                        success_2 = 0;
                        //It's time to redefine the target adding an error and changing the initial condition X.
                        VectorXd Random_for_initial;
                        VectorXd Random_for_target;
                        Random_for_initial = MatrixXd::Random(n, 1);
                        Random_for_target = MatrixXd::Random(n, 1);
                        //This step is different than the one before because changes the target inductively
                        T = T + 0.01 * Random_for_target;
                        X = 0.5 * (UNO + Random_for_initial);
                    }
                }
            }

            //Let's put the best solution of them all inside of X
            for (int i = 0; i < n; ++i) {
                X(i) = temporal_solution(i);
            }

            //The estimation error is defined
            float estimation_error;
            estimation_error = F(X, init_T).dot(F(X, init_T));

            //The solution is defined as a list and sended to an outlet.
            atoms solution(17);
            for (int i = 1; i < 17; i++) {
                solution[i] = 0;
            }
            float plus_n = n + 1;
            float normalizer = 1 / plus_n;
            normalizer = sqrt(normalizer);

            solution[0] = 1 * normalizer;
            for (int i = 0; i < n; ++i)
            {
                solution[i + 1] = X[i] * normalizer;
            }
            output1.send(solution);

            //The error of the estimation is defined as a list and sended to an outlet.
            atoms error(1);
            error[0] = estimation_error;
            output2.send(error);

            //Finally if we could not get to a solution in the first try, an error message is sended to the console.
            if (success == 0) {
                cout << "Warning: a solution could not be found in a reasonable amount of time, so an experimental method was used to find an approximation to the solution." << endl;
                cout << "Remark: trying again with the same target may actually get to a solution, however consider changing a little the input." << endl;
            }

            return {};
            }
    };
};

MIN_EXTERNAL(solver);