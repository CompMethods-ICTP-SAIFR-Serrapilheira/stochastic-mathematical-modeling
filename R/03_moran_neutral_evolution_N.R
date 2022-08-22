# Evolutionary Dynamics: The Moran Model
# Neutral evolution

library(wesanderson)

#get the function from another file
source("functions/functions-moran-model.R")

#Effects population size N------------------------------------------------------
'Different N, same proportion for the initial i (10% * N)'

#Parameters: N 10% (1000 -> 100), i 10% * N
N = 100  #total population size
i = 10   #initial size pop A
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
multiple_neutral_evolution_col(90, 9, 1000, 10, 1)
multiple_neutral_evolution_col(80, 8, 1000, 10, 2)
multiple_neutral_evolution_col(70, 7, 1000, 10, 3)
multiple_neutral_evolution_col(60, 6, 1000, 10, 4)
multiple_neutral_evolution_col(50, 5, 1000, 10, 5)
multiple_neutral_evolution_col(40, 4, 1000, 10, 6)
multiple_neutral_evolution_col(30, 3, 1000, 10, 7)
multiple_neutral_evolution_col(20, 2, 1000, 10, 8)
multiple_neutral_evolution_col(10, 1, 1000, 10, 9)
par(mfrow=c(1,1))


#Grid 2x3:
par(mfrow=c(3,2)) #plot grid
multiple_neutral_evolution_col(10, 5, 100, 10, 1)
multiple_neutral_evolution_col(30, 15, 100, 10, 3)
multiple_neutral_evolution_col(50, 25, 100, 10, 7)
multiple_neutral_evolution_col(100, 50, 100, 10, 5)
multiple_neutral_evolution_col(500, 250, 100, 10, 4)
multiple_neutral_evolution_col(1000, 500, 100, 10, 6)
par(mfrow=c(1,1))


#Grid 1x3:
par(mfrow=c(3,1)) #plot grid
multiple_neutral_evolution(10, 5, 100, 10)
multiple_neutral_evolution(100, 50, 100, 10)
multiple_neutral_evolution(1000, 500, 100, 10)
par(mfrow=c(1,1))


#Grid 1x3:
par(mfrow=c(3,1)) #plot grid
multiple_neutral_evolution_col(10, 5, 200, 10, 1)
multiple_neutral_evolution_col(100, 50, 200, 10, 7)
multiple_neutral_evolution_col(500, 250, 200, 10, 3)
par(mfrow=c(1,1))

pals
par(mfrow=c(3,3))
par(mfrow=c(1,1))

#Grid plot 3x3:
par(mfrow=c(3,3)) #plot grid
multiple_neutral_evolution_col(1000, 500, 1000, 10, 1)
multiple_neutral_evolution_col(500, 250, 1000, 10, 2)
multiple_neutral_evolution_col(100, 50, 1000, 10, 3)
multiple_neutral_evolution_col(80, 40, 1000, 10, 4)
multiple_neutral_evolution_col(60, 30, 1000, 10, 5)
multiple_neutral_evolution_col(40, 4, 1000, 10, 6)
multiple_neutral_evolution_col(30, 3, 1000, 10, 7)
multiple_neutral_evolution_col(20, 2, 1000, 10, 8)
multiple_neutral_evolution_col(10, 1, 1000, 10, 9)
par(mfrow=c(1,1))





