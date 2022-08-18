# Evolutionary Dynamics: The Moran Model
# Neutral evolution

library(wesanderson)

#get the function from another file
source("functions/functions-moran-model.R")


#Multiple runs: different initial values pop A----------------------------------
'Exploring the behaviour of the system for different initial values of the
absolute frequency of allele A in the population (i)'


#Parameters:
N = 1000                                   #total population size
i <- seq(from = 100, to = 900, by = 100)   #initial size pop A
tmax = 1000                                #number of interactions

nruns <- 10  #number of repetitions of the process
range <- 1:nruns


#Color palettes for the plot
cols <- wes_palette("Zissou1", nruns, type = "continuous")
cols2 <- wes_palette("Darjeeling1", nruns, type = "continuous")
cols3 <- wes_palette("GrandBudapest2", nruns, type = "continuous")
cols4 <- wes_palette("FantasticFox1", nruns, type = "continuous")
cols5 <- wes_palette("Moonrise1", nruns, type = "continuous")
cols6 <- wes_palette("Moonrise2", nruns, type = "continuous")
cols7 <- wes_palette("GrandBudapest1", nruns, type = "continuous")
cols8 <- wes_palette("IsleofDogs1", nruns, type = "continuous")
cols9 <- wes_palette("IsleofDogs2", nruns, type = "continuous")

pals <- list(cols, cols2, cols3, cols4, cols5, cols6, cols7, cols8, cols9)

par(mfrow=c(3,3)) #plot grid 3x3


#Simulation: #different palettes for each i, ylim +- 50
for (k in i) {

  for (j in range) {
    sim <- neutral_evolution(N, k, tmax)
    time <- sim[1]
    popA <- sim[2]

    index <- which(i == k)

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = pals[[index]][1],
           xlim = c(0, tmax),
           ylim = c(k - 50, k + 50),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('i =', k))
    }

    else {
      lines(unlist(time),unlist(popA), col = pals[[index]][j])
    }
  }
}


'Just little alterations on the plot options...'
#Simulation: #different palettes for each i, ylim (0, N)
for (k in i) {

  for (j in range) {
    sim <- neutral_evolution(N, k, tmax)
    time <- sim[1]
    popA <- sim[2]

    index <- which(i == k)

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = pals[[index]][1],
           xlim = c(0, tmax),
           ylim = c(0, N),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('i =', k))
    }

    else {
      lines(unlist(time),unlist(popA), col = pals[[index]][j])
    }
  }
}


#Simulation: #one palette, ylim (0, N)
for (k in i) {

  for (j in range) {
    sim <- neutral_evolution(N, k, tmax)
    time <- sim[1]
    popA <- sim[2]

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = cols3[1],
           xlim = c(0, tmax),
           ylim = c(0, N),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('i =', k))
    }

    else {
      lines(unlist(time),unlist(popA), col = cols3[j])
    }
  }
}


#Simulation: #one palette, ylim +- 50
for (k in i) {

  for (j in range) {
    sim <- neutral_evolution(N, k, tmax)
    time <- sim[1]
    popA <- sim[2]

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = cols3[1],
           xlim = c(0, tmax),
           ylim = c(k - 50, k + 50),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('i =', k))
    }

    else {
      lines(unlist(time),unlist(popA), col = cols3[j])
    }
  }

}

par(mfrow=c(1,1)) #return to default grid
