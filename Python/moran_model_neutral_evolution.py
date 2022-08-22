# Evolutionary Dynamics: The Moran Model

import numpy as np
import matplotlib.pyplot as plt

# Neutral evolution
def neutral_evolution(N, i, tmax):

  #Tracking
  popA = [i] #popA.append(i)
  time = [0] #time.append(t)
  t = 0      #initial time
  
  #Simulation:
  while t < tmax:

    #calculating the probabilities 
    Pi_plus = (i/N)* ((N - i)/N)      #A reproduces and B dies
    Pi_minus = (i/N)* ((N - i)/N)     #B reproduces and A dies  
    Pi_stay = 1 - Pi_plus - Pi_minus  #A reproduces and dies or B reproduces and dies

    #Moran process:
    x = np.random.uniform()
    
    if (x < Pi_minus):
      i -= 1 #decrease in A pop
    
    elif (x < (Pi_minus + Pi_plus)):
      i += 1 #increase in A pop
    
    #else: i = i #stay 
    
    popA.append(i)
    t += 1
    time.append(t)
  
  return time, popA

#Parameters
N = 1000    #total population size
i = 500     #initial size of allele A population
tmax = 1000 #number of interactions

#Simulation:
values = neutral_evolution(N, i, tmax)
time = values[0]
popA = values[1]

plt.plot(time, popA)
plt.xlim(0, tmax)



#-------------------------------------------------------------------------------
# Multiple runs

#Parameters
N = 100   #pop size
i = 50   #initial size of pop A
tmax = 10000 #number of interactions

for j in range(10):
  values = neutral_evolution(N, i, tmax) #N, i, tmax
  time = values[0]
  popA = values[1]

  plt.plot(time, popA)

plt.xlim(0, tmax)
plt.xlabel('Time')
plt.ylabel('Absolute frequency of allele A')
plt.ylim(0, N)
plt.rcParams['figure.figsize'] = (32, 12)
plt.rcParams.update({'font.size': 18})
plt.title('Moran Process - Neutral Evolution; N = 100')
plt.savefig('moran-neutral-N100-i50-Py.png')
