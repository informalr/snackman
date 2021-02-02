library(ReinforcementLearning)
#inspired on the following website
#https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html

#STAP 1: importeren van het ascii doolhof en converteren naar
# arena file zoals hieronder.
#dit kunnen we beste als laatst doen, anders wordt hij heel traag
# TODO import ascii art of arena and convert to arena array as described below.
# arena maze as ascii art
#Deze matrix "arena" is een voorbeeld doolhof
arena <- array(
  c(
  c(0,1,0,1,0),
  c(0,1,0,1,0),
  c(0,1,1,1,0),
  c(0,1,0,1,0),
  c(0,0,0,1,0)
  ), dim = c(5,5)
)
#poppetje kan alleen op plekken met een 1.

# Define state and make action sets
#TODO: automatically make list of states, these should be komma seperated string
#STAP 2: converteer de "arena" naar een lijst met states.
#Dit is een lijst met posities waar poppetje kan zijn
#Dus 2,1 en 2,2 en 2,4 en 3,2 en 3,3 en 3,4 etc
#snap je?

#Hier moet dus een loop komen die arena naar deze lijst maakt
#states <- list()
states <- 0
coordinate <- 0

for(row in 1:nrow(arena)) {
  # print("inside first for")
  for(col in 1:ncol(arena)) {
    # print("inside second for")
    if(arena[row, col] == 1)
      coordinate <- paste(toString(row), toString(col), sep = " ")
            states <- append(states, coordinate)
      }
}
#print(states)


#STAP 3 is al af
#Dit is een lijst met mogelijke acties. Dus het poppetje kan naar links, rechts
#boven en beneden
actions <- c("y+1", "y-1", "x-1", "x+1")

#STAP 4 is dan een functie met alle mogelijke transities
#en de bijbehorende beloning
#Deze funtie neemt drie dingen:
#1- de state (dus waar poppetje is)
#2- de actions (dus de 4 mogelijke richtingen)
#3 -de positie van de vijand
#Als het poppetje op de positie van de vijand komt is de beloning hoog
#Als het poppetje veel moet bewegen om daar te komen is de beloning laag

#the function env has all the states, actions and rewards
env <- function (state, action)
{
  next_state <- state
  #dit is dus de movement van het poppetje
  #die vertelt wat de verschillende bewegingen doen met de positie
  #TODO hier uit individuele string van states weer x en y coordinaat peuren
  for(row in 1:nrow(arena)) {
    # print("inside first for")
    for(col in 1:ncol(arena)) {
      if(arena[row, col+1] == 1)
        if (action == "y+1" && arena[row + 1, col] == "1")
          next_state <- paste(c(toString(row + 1), toString(col)), sep = " ")
        #TODO hieronder ook aanpassen
        if (action == "y-1" && arena[row -1 , col] == "1")
          next_state <- c(row - 1, col)
        if (action == "x+1" && arena[row, col + 1] == "1")
          next_state <- c(row, col + 1)
        if (action == "x-1" && arena[row, col - 1] == "1")
          next_state <- c(row, col - 1)
        if (next_state == state(4,5) && state != state(4,5)) {
          reward <- 10
        }
        else {
          reward <- -1
        }

        }
    }

  out <- list(NextState = next_state, Reward = reward)
  return(out)
}


# STAP 5: dit is ook al af. Parameters om naar de AI library te sturen
#zoals uitgelegd in bovenstaande website
# Sample N = 1000 random sequences from the environment
data <- sampleExperience(N = 10000,
                         env = env,
                         states = states,
                         actions = actions)


#head(data)

# Define reinforcement learning parameters
control <- list(alpha = 0.1, gamma = 0.5, epsilon = 0.1)

# Perform reinforcement learning
model <- ReinforcementLearning(data,
                               s = "State",
                               a = "Action",
                               r = "Reward",
                               s_new = "NextState",
                               control = control)

# Print policy
computePolicy(model)
