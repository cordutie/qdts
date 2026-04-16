from Preamble.equations_groebner_tester import *
from multiprocessing import Pool
import time

if __name__ == '__main__':
    #The systems with 2 to N equations will be tested
    N=6

    #List of Parameters
    parameters = [i for i in range(2, N)]

    #Groebner basis computations using Multiprocessing
    start = time.perf_counter()
    with Pool(processes=None) as p:
        results = p.map(tester_F5_simpler_system, parameters)
    finish = time.perf_counter()

    time=round(finish - start, 2)

    log_file = open("execution_time_multiprocessing.txt", "w")
    log_file.write(time)
    log_file.close()