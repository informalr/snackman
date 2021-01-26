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
# Ljist
arena_list <- list()
# PoC example
arena_exp <- c(0,1,2,3)
# X positie counter
a <- 0
# Y positive counter
b <- 0
states <- list()

for (a in arena[1]) {
  for (b in arena[2]) {
    if (arena(a,b) == 1)
          list.append(states, paste(c(toString(a), toString(b)), sep = " "))
  }
}

print(states)
#for x = 1 to end
#for y = 1 to end
# if arena(x,y) = 1 then amend states with x,y
states <- paste(c(toString(x), toString(y)), sep = "") # begin state
#dit is dan dus een lijst met alle mogelijke states waar het poppetje kan zijn

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
  #TODO hier uit individuele string van states weer x en y coordinaat peuren
  if (action == "y+1" && arena[x, y + 1] == "1")
  next_state <- paste(c(toString(x), toString(y+1)), sep = " ")
  #TODO hieronder ook aanpassen
  if (action == "y-1" && arena[state[1], state[2] - 1] == "1")
    next_state <- c(state[1], state[2] - 1)
  if (action == "x+1" && arena[state[1] + 1, state[2]] == "1")
    next_state <- c(state[1] + 1, state[2])
  if (action == "x-1" && arena[state[1] - 1, state[2]] == "1")
    next_state <- c(state[1] - 1, state[2])
  if (next_state == state(4,5) && state != state(4,5)) {
    reward <- 10
  }
  else {
    reward <- -1
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
