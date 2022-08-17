# Neutral evolution Moran model function

def neutral_evolution(N, i, tmax):

  #Tracking
  popA = [i] #popA.append(i)
  time = [0] #time.append(t)

  t = 0     #initial time
  
  #Simulation:
  while t < tmax:

    #calculating the probabilities 
    Pi_plus = (i/N)* ((N - i)/N)      #A reproduces and B dies
    Pi_minus = (i/N)* ((N - i)/N)     #B reproduces and A dies  
    Pi_stay = 1 - Pi_plus - Pi_minus  #A reproduces and dies or B reproduces and dies

    #'coin':
    x = np.random.uniform()
    
    if (x < Pi_minus):
      i -= 1 #decrease in A pop
    
    elif (x < (Pi_minus + Pi_plus)):
      i += 1 #increase in A pop
    
    else:
      i = i #stay 
    
    popA.append(i)
    t += 1
    time.append(t)
  
  return time, popA
