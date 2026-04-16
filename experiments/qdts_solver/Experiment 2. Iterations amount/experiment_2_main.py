import numpy as np
from Preamble.results_building import *
from Preamble.functions import *

def sampler(n,m):
    # Create a list of m targets of n entries
    targets = []
    for i in range(m):
        targets.append(np.random.rand(n))
    return targets

def experiment_tolerance(samples,tolerance):
    # Now we solve the problem for each good target counting their iterations using the tolerance given
    size = len(samples)
    n=samples[0].size
    results = np.empty(size)
    results_contador = np.empty(size)
    bad_indexes = []
    for i in range(len(samples)):
        success = 0
        contador = 0
        iterations = 0
        while success == 0 and contador < 10:
            contador+=1
            temp_sol = newton(np.random.rand(n), samples[i], 0.0001, tolerance)
            success = temp_sol[0]
            iterations = temp_sol[2]
        if success==1:
            results[i] = iterations
            results_contador[i]=contador
        else:
            bad_indexes.append(i)
    final_results=np.delete(results,bad_indexes)
    final_results_contador=np.delete(results_contador,bad_indexes)
    good_targets_size=final_results.size
    resultados=[n,good_targets_size,np.mean(final_results), np.std(final_results), np.percentile(final_results, 50), np.percentile(final_results, 90), np.percentile(final_results, 99),np.mean(final_results_contador), np.std(final_results_contador), np.percentile(final_results_contador, 50), np.percentile(final_results_contador, 90), np.percentile(final_results_contador, 99),]
    return resultados

M=100000

results=[]
results.append(["number of equations","size of the good targets found","mean of iterations","standard deviation of iterations","percentile 50 of iterations","percentile 90 of iterations","percentile 99 of iterations","mean of contador","standard deviation of contador","percentile 50 of contador","percentile 90 of contador","percentile 99 of contador" ])
samples = sampler(8,M)
results.append(experiment_tolerance(samples,100))
samples = sampler(12,M)
results.append(experiment_tolerance(samples,100))
samples = sampler(16,M)
results.append(experiment_tolerance(samples,100))

results_to_excel(results,"results.xlsx")