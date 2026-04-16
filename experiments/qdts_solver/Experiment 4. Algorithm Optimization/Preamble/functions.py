import numpy as np

#S is the left shift function. For example, S(1,2,3)=(2,3,0)
def S(X):
    N=X.size
    shifted=np.zeros(N)
    for i in range(0,N-1):
        shifted[i]=X[i+1]
    return shifted

#R is the right shift function. For example, S(1,2,3)=(0,1,2)
def R(X):
    N=X.size
    shifted=np.zeros(N)
    for i in range(0,N-1):
        shifted[i+1]=X[i]
    return shifted

#SN(X,n) applies S n times to the vector X
def SN(X,n):
    nshifted=X
    for i in range(0,n):
        nshifted=S(nshifted)
    return nshifted

#RN(X,n) applies R n times to the vector X
def RN(X,n):
    nshifted=X
    for i in range(0,n):
        nshifted=R(nshifted)
    return nshifted

#The function A generates the right part of the equation (17) in the paper considering A_1=1. For example,
#A(2,3,4)=( 1*2 + 2*3 + 3*4  =(20
#           1*3 + 2*4          11
#           1*4             )  4)
#A:R^N -> R^N, where N+1 is the number of sinusoids and N is the number of target harmonics.
def A(X):
    N=X.size
    Y=np.zeros(N+1)
    Y[0]=1
    for i in range(1,N+1):
        Y[i]=X[i-1]
    Z=np.zeros(N)
    for i in range(0,N):
        Z[i]=np.dot(Y,SN(Y,i+1))
    return Z

#The function F is the system (17) equals 0 again with A_1=1.
def F(X,T):
    return A(X)-T

#The Jacobian matrix is defined
def DF(X):
    N=X.size
    Z=np.zeros((N,N))
    for i in range(0,N-1):
        temp=SN(X,i+1)+RN(X,i+1)
        for j in range(0,N):
            Z[i,j]=temp[j]
    Z=Z+np.identity(N)
    return Z

#Newton method is implemented in the function newton. Its arguments are:
#X=initial condition
#T=target
#e=accepted error
#tolerance=amount of iterations until exit
#The result is a list such that
#result[0] = 0 or 1 depending on if the algorithm converged or not
#result[1] = the actual result
#result[2] = number of iterations to get to the result
def newton(X,T,error,tolerance):
    #succes=1 means we won
    #exit=1 means it is time to leave
    iteration=0
    while np.dot(F(X,T),F(X,T))>error and iteration<tolerance:
        iteration+=1
        X=np.linalg.solve(DF(X),np.matmul(DF(X),X) - F(X,T))
    if np.dot(F(X,T),F(X,T))<error:
        succes=1
    else:
        succes=0
    return [succes,X,iteration]

# T=np.array([0.93952558, 0.94882637, 0.61436341, 0.77319616, 0.82396684, 0.91395158,
#  0.41048623, 0.28023464])
# X = np.random.rand(8)
# print(newton(X,T,0.001,100)[2])

# #Testing
# X=np.array([0.5,0.5,0.5])
# T=np.array([1,2,1])
# error=0.001
# tolerance=100
#
# solucion=newton(T,X,error,tolerance)
# print(T)
#
# print(solucion)
# Y=solucion[1]
# test=np.dot(F(Y,T),F(Y,T))
#
# print("el error final fue de "+ str(test))



