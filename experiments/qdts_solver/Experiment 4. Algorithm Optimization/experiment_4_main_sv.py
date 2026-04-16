from Preamble.functions import *
from Preamble.results_building import *
import copy

#The experiment is implemented in the function Experiment. It's arguments are:
#technique: a list of the form [a,b,c] that tells what combination of techniques is used to solve the problem
#T: The target distribution of amplitudes to solve
#The output of the function is a list of two entries which are:
#solution: the solution X such that D(X)=T
#iterations: The number of iterations necessary to get to the result
def Experiment(technique,T,tolerance):
    #amount of variables
    m=T.size
    epsilon=np.divide(0.01,np.sqrt(m))
    initial_T=copy.copy(T)

    #About initial condition:
    if technique[0]==0:
        X = np.zeros(m)
        for i in range(m):
            X[i]=0.5
    elif technique[0]==1:
        X = np.random.rand(m)

    succes=0
    iterations=0
    while succes==0:
        #Run Newton methon
        temp_sol=newton(X,T,0.0001,tolerance)
        succes=temp_sol[0]
        iterations+=temp_sol[2]

        if succes==0:
            # At fail: About the initial condition
            if technique[1]==0:
                X = np.zeros(m)
                for i in range(m):
                    X[i] = 0.5
            elif technique[1]==1:
                X = np.random.rand(m)
            # At fail: About the target
            if technique[2]==0:
                T=initial_T+epsilon*np.random.rand(m)
            elif technique[2]==1:
                T=T+epsilon*np.random.rand(m)
    # Once we leave the loop we already have a solution
    solution=temp_sol[1]
    error=np.dot(F(solution,initial_T),F(solution,initial_T))
    return [solution,iterations,error]

#The list of possible and reasonable techniques is defined
technique=[[0,1,0],[0,1,1],[1,1,0],[1,1,1]]

#Actual experiment

#Number of equations
n=8
#number of samples for the experiment
m=10000

results=[["Technique","Iterations mean","Iterations Standard Deviance","Iterations Percentile 50","Iterations Percentile 90","Iterations Percentile 99","Errors mean","Errors Standard Deviance","Errors Percentile 50","Errors Percentile 90","Errors Percentile 99"]]
for i in range(len(technique)):
    results_iterations_i=np.empty(m)
    results_errors_i=np.empty(m)
    for j in range(m):
        T = np.random.rand(n)
        temp_sol=Experiment(technique[i],T,72)
        results_iterations_i[j]=temp_sol[1]
        results_errors_i[j]=temp_sol[2]
        print("technique = "+str(technique[i])+" j = "+str(j))
    results_technique_i=[str(technique[i]),np.mean(results_iterations_i),np.std(results_iterations_i),np.percentile(results_iterations_i,50),np.percentile(results_iterations_i,90),np.percentile(results_iterations_i,99),np.mean(results_errors_i),np.std(results_errors_i),np.percentile(results_errors_i,50),np.percentile(results_errors_i,90),np.percentile(results_errors_i,99)]
    results.append(results_technique_i)
    print("Technique "+str(technique[i])+" just finished :)")

#Exporting results to a .xlsx file
results_to_excel(results,"results_8_eq_sv.xlsx")

# --------------------------------------

#Number of equations
n=12
#number of samples for the experiment
m=10000

results=[["Technique","Iterations mean","Iterations Standard Deviance","Iterations Percentile 50","Iterations Percentile 90","Iterations Percentile 99","Errors mean","Errors Standard Deviance","Errors Percentile 50","Errors Percentile 90","Errors Percentile 99"]]
for i in range(len(technique)):
    results_iterations_i=np.empty(m)
    results_errors_i=np.empty(m)
    for j in range(m):
        T = np.random.rand(n)
        temp_sol=Experiment(technique[i],T,80)
        results_iterations_i[j]=temp_sol[1]
        results_errors_i[j]=temp_sol[2]
    results_technique_i=[str(technique[i]),np.mean(results_iterations_i),np.std(results_iterations_i),np.percentile(results_iterations_i,50),np.percentile(results_iterations_i,90),np.percentile(results_iterations_i,99),np.mean(results_errors_i),np.std(results_errors_i),np.percentile(results_errors_i,50),np.percentile(results_errors_i,90),np.percentile(results_errors_i,99)]
    results.append(results_technique_i)
    print("Technique "+str(technique[i])+" just finished :)")

#Exporting results to a .xlsx file
results_to_excel(results,"results_12_eq_sv.xlsx")

#--------------------------------------

#Number of equations
n=16
#number of samples for the experiment
m=10000

results=[["Technique","Iterations mean","Iterations Standard Deviance","Iterations Percentile 50","Iterations Percentile 90","Iterations Percentile 99","Errors mean","Errors Standard Deviance","Errors Percentile 50","Errors Percentile 90","Errors Percentile 99"]]
for i in range(len(technique)):
    results_iterations_i=np.empty(m)
    results_errors_i=np.empty(m)
    for j in range(m):
        T = np.random.rand(n)
        temp_sol=Experiment(technique[i],T,88)
        results_iterations_i[j]=temp_sol[1]
        results_errors_i[j]=temp_sol[2]
    results_technique_i=[str(technique[i]),np.mean(results_iterations_i),np.std(results_iterations_i),np.percentile(results_iterations_i,50),np.percentile(results_iterations_i,90),np.percentile(results_iterations_i,99),np.mean(results_errors_i),np.std(results_errors_i),np.percentile(results_errors_i,50),np.percentile(results_errors_i,90),np.percentile(results_errors_i,99)]
    results.append(results_technique_i)
    print("Technique "+str(technique[i])+" just finished :)")

#Exporting results to a .xlsx file
results_to_excel(results,"results_16_eq_sv.xlsx")