# Functions---------------------------------------------------------------------

'Atention: Required Rpackage: "wesanderson". The package is required in order to
plot the multiple graphics functions.'

# Neutral evolution Moran model function----------------------------------------

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


# Neutral evolution Moran model function: nruns with the same parameters--------

multiple_neutral_evolution <- function(N, i, tmax, nruns) {
  #multiple_neutral_evolution(total pop size, initial size pop A,
                              # interactions, # of repetitions of the process)

  'Gives the evolution dynamics of the allele A in a finite population of
   constant size in which two alleles A and B are competing for dominance, for
   multiple observations/repetitions of the same process (same parameters N, i,
   tmax).'

  #Color palette for the plot:
  cols <- wes_palette("Zissou1", nruns, type = "continuous")

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

# Neutral evolution Moran model function: nruns with the same parameters +
# different palettes------------------------------------------------------------

multiple_neutral_evolution_col <- function(N, i, tmax, nruns, index) {
  #multiple_neutral_evolution_col(total pop size, initial size pop A,
  #                               # interactions, # of repetitions of the
  #                               process, palette selector in vector pals)


  #Color palettes for the plot:
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
