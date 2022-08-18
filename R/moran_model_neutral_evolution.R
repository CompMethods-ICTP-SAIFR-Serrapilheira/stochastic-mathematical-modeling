# Evolutionary Dynamics: The Moran Model
# Neutral evolution

#Creating a function for neutral evolution with the Moran Model-----------------

neutral_evolution <- function(N, i, tmax) {
   #neutral_evolution(total pop size, initial size pop A, # interactions)

  'Gives the evolution dynamics of the allele A in a finite population of
   constant size in which two alleles A and B are competing for dominance.'

  #Recording:
  popA <- c(i)  #Absolute freq allele A (# A individuals); i: initial value
  time <- c(0)  #Interactions
  t = 0         #initial time

  #Simulation: Moran process:
  while (t < tmax) {

    'At each interation one individual of the total population N is choosen to
    reproduce and one is choosen to die, both randomly sorted. The four possible
    combinations lead to 3 outcomes in terms of the absolute frequence of A:
    increase +1, decrease -1 or stay the same. Which one takes place is choosen
    randomly, acording to their respective probabilities: Pi+, Pi-, Pii'

    'Neutral evolution implies same probability of increase or decrease in the
     allele A population size'
    Pi <- (i/N)*((N - i)/N)

    x <- runif(1, min = 0, max = 1)  #Random number

    if (x < Pi) {
      i = i - 1  #decrease in A pop
    }

    else if (x < 2*Pi) {
      i = i + 1  #increase in A pop
    }

    #else: stay i

    popA <- append(popA, i)
    t = t + 1
    time <- append(time, t)

  }

  result <- list()
  result[[1]] <- time
  result[[2]] <- popA
  return(result)
}


#Simulating evolutionary dynamics-----------------------------------------------

#Parameters:
N = 1000  #total population size
i = 100   #initial size pop A
tmax = 1000  #number of interactions

#Simulation:
sim <- neutral_evolution(N, i, tmax)
time <- sim[1]
popA <- sim[2]

#Plotting
plot(unlist(time),unlist(popA), type = 'l',
     xlim = c(0, tmax),
     xlab = 'Time',
     ylab = 'Absolute frequency of the allele A in the population',
     col = 'blue',
     main = 'Moran process: Neutral evolution')

#Multiple runs------------------------------------------------------------------

install.packages("wesanderson")
library("wesanderson")

cols <- wes_palette("GrandBudapest2", 10, type = "continuous")
cols2 <- wes_palette("Darjeeling1", 10, type = "continuous")
cols3 <- wes_palette("Zissou1", 10, type = "continuous")

#Parameters:
N = 1000  #total population size
i = 100   #initial size pop A
tmax = 1000  #number of interactions

nruns <- 10
range <- 1:nruns

#Simulation:
for (j in range) {
  sim <- neutral_evolution(N, i, tmax)
  time <- sim[1]
  popA <- sim[2]

  if (j == 1) {
    plot(unlist(time),unlist(popA), type = 'l', col = cols3[1],
         xlim = c(0, tmax),
         ylim = c(i - 50, i + 50),
         xlab = 'Time',
         ylab = 'Absolute frequency of the allele A in the population',
         main = 'Moran process: Neutral evolution')
  }

  else {
    lines(unlist(time),unlist(popA), col = cols3[j])
  }
}
