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
  while (t < tmax && i != N && i != 0) {

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

cols <- wes_palette("Zissou1", 10, type = "continuous")
cols2 <- wes_palette("Darjeeling1", 10, type = "continuous")
cols3 <- wes_palette("GrandBudapest2", 10, type = "continuous")

#Parameters:
N = 1000  #total population size
i = 100   #initial size pop A
tmax = 1000  #number of interactions

nruns <- 10  #number of repetitions of the process
range <- 1:nruns

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
         main = 'Moran process: Neutral evolution')
  }

  else {
    lines(unlist(time),unlist(popA), col = cols[j])
  }
}


#Multiple runs: different initial values pop A----------------------------------

names(wes_palettes)
cols <- wes_palette("Zissou1", 10, type = "continuous")
cols2 <- wes_palette("Darjeeling1", 10, type = "continuous")
cols3 <- wes_palette("GrandBudapest2", 10, type = "continuous")
cols4 <- wes_palette("FantasticFox1", 10, type = "continuous")
cols5 <- wes_palette("Moonrise1", 10, type = "continuous")
cols6 <- wes_palette("Moonrise2", 10, type = "continuous")
cols7 <- wes_palette("GrandBudapest1", 10, type = "continuous")
cols8 <- wes_palette("IsleofDogs1", 10, type = "continuous")
cols9 <- wes_palette("IsleofDogs2", 10, type = "continuous")

pals <- list(cols, cols2, cols3, cols4, cols5, cols6, cols7, cols8, cols9)

#Parameters:
N = 1000                                   #total population size
i <- seq(from = 100, to = 900, by = 100)   #initial size pop A
tmax = 1000                                #number of interactions

par(mfrow=c(3,3)) #plot grid

#Simulation: #different palettes for each i, ylim +- 50
for (k in i) {

  nruns <- 10
  range <- 1:nruns

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
           main = k)
    }

    else {
      lines(unlist(time),unlist(popA), col = pals[[index]][j])
    }
  }
}


'Just little alterations on the plot options...'
#Simulation: #different palettes for each i, ylim (0, N)
for (k in i) {

  nruns <- 10
  range <- 1:nruns

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
           main = k)
    }

    else {
      lines(unlist(time),unlist(popA), col = pals[[index]][j])
    }
  }
}


#Simulation: #one palette, ylim (0, N)
for (k in i) {

  nruns <- 10
  range <- 1:nruns

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
           main = k)
    }

    else {
      lines(unlist(time),unlist(popA), col = cols3[j])
    }
  }
}

par(mfrow=c(1,1))


#Effects population size N------------------------------------------------------
'Different N, same proportion for the initial i (10% * N)'

#Parameters: N 10% (1000 -> 100), i 10% * N
N = 100  #total population size
i = 10   #initial size pop A
tmax = 1000  #number of interactions

nruns <- 10
range <- 1:nruns

#Simulation:
for (j in range) {
  sim <- neutral_evolution(N, i, tmax)
  time <- sim[1]
  popA <- sim[2]

  if (j == 1) {
    plot(unlist(time),unlist(popA), type = 'l', col = cols[1],
         xlim = c(0, tmax),
         ylim = c(0, N),
         xlab = 'Time',
         ylab = 'Absolute frequency of the allele A in the population',
         main = 'Moran process: Neutral evolution')
  }

  else {
    lines(unlist(time),unlist(popA), col = cols[j])
  }
}


#Defining a new function for nruns with the same parameters
multiple_neutral_evolution <- function(N, i, tmax, nruns) {

  range <- 1:nruns

  #Simulation:
  for (j in range) {
    sim <- neutral_evolution(N, i, tmax)
    time <- sim[1]
    popA <- sim[2]

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = cols[1],
           xlim = c(0, tmax),
           ylim = c(0, N),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('N =', N))
    }

    else {
      lines(unlist(time),unlist(popA), col = cols[j])
    }
  }
}


#Parameters: N 50% (1000 -> 500), i 10% * N
N = 500  #total population size
i = 50   #initial size pop A
tmax = 1000  #number of interactions
nruns <- 10

multiple_neutral_evolution(N, i, tmax, nruns)


#Parameters: N 20% (1000 -> 200), i 10% * N
N = 200  #total population size
i = 20   #initial size pop A
tmax = 1000  #number of interactions
nruns <- 10

multiple_neutral_evolution(N, i, tmax, nruns)


#Grid plot
par(mfrow=c(3,2)) #plot grid
multiple_neutral_evolution(1000, 100, 1000, 10)
multiple_neutral_evolution(500, 50, 1000, 10)
multiple_neutral_evolution(200, 20, 1000, 10)
multiple_neutral_evolution(100, 10, 1000, 10)
multiple_neutral_evolution(50, 5, 1000, 10)
multiple_neutral_evolution(10, 1, 1000, 10)
par(mfrow=c(1,1))


#defining function for nruns with the same parameters + different palettes
multiple_neutral_evolution_col <- function(N, i, tmax, nruns, index) {

  range <- 1:nruns

  #Simulation:
  for (j in range) {
    sim <- neutral_evolution(N, i, tmax)
    time <- sim[1]
    popA <- sim[2]

    if (j == 1) {
      plot(unlist(time),unlist(popA), type = 'l', col = pals[[index]][1],
           xlim = c(0, tmax),
           ylim = c(0, N),
           xlab = 'Time',
           ylab = 'Abs freq allele A',
           main = paste('N =', N))
    }

    else {
      lines(unlist(time),unlist(popA), col = pals[[index]][j])
    }
  }
}


#Grid plot: different palettes
par(mfrow=c(3,2)) #plot grid
multiple_neutral_evolution_col(1000, 100, 1000, 10, 1)
multiple_neutral_evolution_col(500, 50, 1000, 10, 7)
multiple_neutral_evolution_col(200, 20, 1000, 10, 3)
multiple_neutral_evolution_col(100, 10, 1000, 10, 4)
multiple_neutral_evolution_col(50, 5, 1000, 10, 5)
multiple_neutral_evolution_col(10, 1, 1000, 10, 6)
par(mfrow=c(1,1))

#Grid plot 3x3:
par(mfrow=c(3,3)) #plot grid
multiple_neutral_evolution_col(90, 9, 1000, 10, 5)
multiple_neutral_evolution_col(80, 8, 1000, 10, 5)
multiple_neutral_evolution_col(70, 7, 1000, 10, 5)
multiple_neutral_evolution_col(60, 6, 1000, 10, 5)
multiple_neutral_evolution_col(50, 5, 1000, 10, 5)
multiple_neutral_evolution_col(40, 4, 1000, 10, 5)
multiple_neutral_evolution_col(30, 3, 1000, 10, 5)
multiple_neutral_evolution_col(20, 2, 1000, 10, 5)
multiple_neutral_evolution_col(10, 1, 1000, 10, 5)
par(mfrow=c(1,1))

#Grid 1x3:
par(mfrow=c(3,1)) #plot grid
multiple_neutral_evolution(10, 5, 100, 10)
multiple_neutral_evolution(100, 50, 100, 10)
multiple_neutral_evolution(1000, 500, 100, 10)
par(mfrow=c(1,1))
