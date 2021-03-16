library(stringr)
library(ReinforcementLearning)
#inspired on the following website
#https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html

#positie enemy
enemy = "3 3"

# arena maze as ascii art
#Deze matrix "arena" is een voorbeeld doolhof
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

# Define state and make action sets
#automatically make list of states, these should be komma seperated string
states <- list()
n_states <- 0
for(row in 1:nrow(arena)) {
  for(col in 1:ncol(arena)) {
    # print("inside second for")
    if(arena[row, col] == 1) {
      states[[n_states + 1]] <- list(row = row, col = col)
      n_states <- n_states + 1
    }
  }
}
#STAP4B
#States omzetten naar type string
states_strings <- rep("", length(states))
for(i in seq_along(states)) {
  states_strings[i] <- paste(states[[i]]$row, states[[i]]$col)
}
states <- states_strings


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
  # Convert state to list with col and row
  coordinat <- as.numeric(stringr::str_split(string = state, pattern = " ")[[1]])
  next_state <- state

  col <- coordinat[2]
  row <- coordinat[1]

  next_col <- coordinat[2]
  next_row <- coordinat[1]
  if (action == "down" && row < nrow(arena) && arena[row, col] == 1
      && arena[row + 1, col] == 1) {
    next_row <- row + 1
  }
  if (action == "up" && row > 1 && arena[row, col] == 1 && arena[row - 1, col] == 1) {
    next_row <- row - 1
  }
  if (action == "right" && col < ncol(arena) && arena[row, col] == 1
      && arena[row, col + 1] == 1) {
    next_col <- col + 1
  }
  if (action == "left" && col > 1 && arena[row, col] == 1
      && arena[row, col - 1] == 1) {
    next_col <- col - 1
  }
  next_state = paste(next_row, next_col)

  if (next_state == enemy && state != enemy) {
    reward <- 10
  } else {
    reward <- -1
  }

  # Convert to string
  list(NextState = next_state, Reward = reward)
}

#Parameters om naar de AI library te sturen
#zoals uitgelegd in bovenstaande website
# Sample N = 1000 random sequences from the environment
data <- ReinforcementLearning::sampleExperience(
   N = 1000,
   env = env,
   states = states,
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

