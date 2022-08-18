# Evolutionary Dynamics: The Moran Model
# Neutral evolution

library(wesanderson)

#get the function from another file
source("functions/functions-moran-model.R")

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

#Parameters:
N = 1000  #total population size
i = 100   #initial size pop A
tmax = 1000  #number of interactions

nruns <- 10  #number of repetitions of the process
range <- 1:nruns

cols <- wes_palette("Zissou1", nruns, type = "continuous")

#Simulation:
for (j in range) {
  sim <- neutral_evolution(N, i, tmax)
  time <- sim[1]
  popA <- sim[2]

  if (j == 1) {
    plot(unlist(time),unlist(popA), type = 'l', col = cols[1],
         xlim = c(0, tmax),
         ylim = c(i - 50, i + 50),
         xlab = 'Time',
         ylab = 'Absolute frequency of the allele A in the population',
         main = paste('Moran process: Neutral evolution ( N =', N, ')'))
  }

  else {
    lines(unlist(time),unlist(popA), col = cols[j])
  }
}
