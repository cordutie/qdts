from Preamble.functions import *
from Preamble.results_building import *
def sampler(n,m):
    # Create a list of m targets of n entries
    targets = []
    for i in range(m):
        targets.append(np.random.rand(n))
    return targets

def bad_samples(targets,tolerance):
    # Try to solve every target up to l times and save the targets that could be solved in less than 10 tries with 100 iterations each
    l = 10
    bad_targets = []
    n=targets[0].size
    for i in range(len(targets)):
        j = 0
        succes = 0
        while succes == 0 and j < l:
            j += 1
            temp_sol = newton(np.random.rand(n), targets[i], 0.0001, tolerance)
            succes = temp_sol[0]
        if succes == 0:
            bad_targets.append(targets[i])
    return bad_targets

def experiment_conjecture(bad_targets,tolerance):
    #If no solution could be found, try with T + a small random vector until it can find a solution (maximum repeat=k) and save the number of iterations needed to solve this
    #(k*tolerance will then mean that it could not be solved)
    k=1000
    results=[]
    n=bad_targets[0].size
    for i in range(len(bad_targets)):
        j=0
        succes=0
        while succes==0 and j<k:
            j+=1
            current_shifted_target = bad_targets[i] + 0.01 * np.random.rand(n)
            temp_sol=newton(np.random.rand(n),current_shifted_target,0.0001,tolerance)
            succes=temp_sol[0]
        if succes==0:
            results.append(bad_targets[i])
    return results

samples=sampler(8,100000)
bad_targets=bad_samples(samples,72)
results=experiment_conjecture(bad_targets,72)
if len(results) != 0:
    results_to_excel(results, "results_8eq.xlsx")

samples=sampler(12,100000)
bad_targets=bad_samples(samples,80)
results=experiment_conjecture(bad_targets,80)
if len(results) != 0:
    results_to_excel(results, "results_12eq.xlsx")

samples=sampler(16,100000)
bad_targets=bad_samples(samples,88)
results=experiment_conjecture(bad_targets,88)
if len(results) != 0:
    results_to_excel(results, "results_16eq.xlsx")