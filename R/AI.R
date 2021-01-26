library(ReinforcementLearning)
#inspired on the following website
#https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html

# TODO import ascii art of arena and convert to arena array as described below.
# arena maze as ascii art
arena <- array(
  c(
  c(0,1,0,0,0),
  c(0,1,0,1,0),
  c(0,1,1,1,0),
  c(0,1,0,1,0),
  c(0,0,0,1,0)
  ), dim = c(5,5)
)

# Define state and make action sets
#TODO: automatically make list of states, these should be komma seperated string

#for x = 1 to end
#for y = 1 to end
# if arena(x,y) = 1 then amend states with x,y
states <- paste(c(toString(x), toString(y)), sep = "") # begin state
#dit is dan dus een lijst met alle mogelijke states waar het poppetje kan zijn

actions <- c("y+1", "y-1", "x-1", "x+1")

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
