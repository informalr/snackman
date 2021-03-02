library(stringr)
library(ReinforcementLearning)
#inspired on the following website
#https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html

#STAP 1: importeren van het ascii doolhof en converteren naar
# arena file zoals hieronder.
#dit kunnen we beste als laatst doen, anders wordt hij heel traag
# TODO import ascii art of arena and convert to arena array as described below.
# arena maze as ascii art
#Deze matrix "arena" is een voorbeeld doolhof

# Topology for humans, in memory it is transposed ...
arena <- array(
  c(
  c(0,1,0,1,0),
  c(0,1,0,1,0),
  c(0,1,1,1,0),
  c(0,1,0,1,0),
  c(0,0,0,1,0),
  c(0,0,0,1,0)
  ), dim = c(5, 6)
)

arena <- t(arena)
arena

#poppetje kan alleen op plekken met een 1.

# Define state and make action sets
#TODO: automatically make list of states, these should be komma seperated string
#STAP 2: converteer de "arena" naar een lijst met states.
#Dit is een lijst met posities waar poppetje kan zijn
#Dus 2,1 en 2,2 en 2,4 en 3,2 en 3,3 en 3,4 etc
#snap je?

#Hier moet dus een loop komen die arena naar deze lijst maakt
#states <- list()

#states must be type string/characters!!!!!!
states <- list()
n_states <- 0


for(row in 1:nrow(arena)) {
  # print("inside first for")
  for(col in 1:ncol(arena)) {
    # print("inside second for")
    if(arena[row, col] == 1) {
      states[[n_states + 1]] <- list(row = row, col = col)
      n_states <- n_states + 1
    }
  }
}



#STAP 3 is al af
#Dit is een lijst met mogelijke acties. Dus het poppetje kan naar links, rechts
#boven en beneden
actions <- c("up", "right", "down", "left")

#STAP 4 is dan een functie met alle mogelijke transities
#en de bijbehorende beloning
#Deze funtie neemt drie dingen:
#1- de state (dus waar poppetje is)
#2- de actions (dus de 4 mogelijke richtingen)
#3 -de positie van de vijand
#Als het poppetje op de positie van de vijand komt is de beloning hoog
#Als het poppetje veel moet bewegen om daar te komen is de beloning laag

#the function env has all the states, actions and rewards
env <- function(state, action) {
  if (1 == 2) {
    state <- "3 2"
    action <- "up"
  }
  # Convert state to list with col and row
  coordinat <- as.numeric(stringr::str_split(string = state, pattern = " ")[[1]])
  #state <- list(row = coordinat[1], col = coordinat[2])

  next_state <- state
  #dit is dus de movement van het poppetje
  #die vertelt wat de verschillende bewegingen doen met de positie
  #TODO hier uit individuele string van states weer x en y coordinaat peuren

  col <- coordinat[1]
  row <- coordinat[2]
  next_col <- coordinat[1]
  next_row <- coordinat[2]

  for(j in 1:ncol(arena)) {
    # col<-cols[j]
    # print("inside first for")
    for(i in 1:nrow(arena)) {
      # row<-rows[i]
  if (action == "down" && i < nrow(arena) - 1 && arena[i, j] == 1
      && arena[i + 1, j] == 1) {
    next_row <- i + 1
  }
  if (action == "up" && i > 1 && arena[i, j] == 1 && arena[i - 1, j] == 1) {
    next_row <- i - 1
  }
  if (action == "right" && j < ncol(arena) - 1 && arena[i, j] == 1
      && arena[i, j + 1] == 1) {
    next_col <- j + 1
  }
  if (action == "left" && j > 1 && arena[i, j] == 1
      && arena[i, j - 1] == 1) {
    next_col <- j - 1
  }
    }}

  if (next_state == "6 4" && state != "6 4") {
    reward <- 10
  } else {
    reward <- -1
  }

  # Convert to string
  list(NextState = paste(next_row, next_col), Reward = reward)
}

#STAP4B
#States omzetten naar type string
states_strings <- rep("", length(states))
for(i in seq_along(states)) {
  states_strings[i] <- paste(states[[i]]$row, states[[i]]$col)
}
states <- states_strings


# STAP 5: dit is ook al af. Parameters om naar de AI library te sturen
#zoals uitgelegd in bovenstaande website
# Sample N = 1000 random sequences from the environment
data <- ReinforcementLearning::sampleExperience(
   N = 10000,
   env = env,
   states = states_strings,
   actions = actions
)


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

