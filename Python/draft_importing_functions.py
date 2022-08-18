#In R:
# get the function from another file
#source("functions/logGrowth.R")

#Python:
import numpy as np
import matplotlib.pyplot as plt
import functions-moran-model.py as mm

#Parameters
N = 1000   #pop size
i = 500    #initial size of pop A
tmax = 1000 #number of interactions

#Simulation:
values = mm.neutral_evolution(N, i, tmax)
time = values[0]
popA = values[1]

plt.plot(time, popA)
plt.xlim(0, tmax)
