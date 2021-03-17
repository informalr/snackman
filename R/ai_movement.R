
#' AI movement
#'
#' @param x_pos x position of the player in the arena.
#' @param y_pos y position of the player in the arena.
#' @param arena_filename Path to the text file containing the arena.
#' @details See http://shorturl.at/wyCNT
#' @return
#' @export
ai_movement <- function(x_pos, y_pos, arena_filename) {

  # (y, x) position as character string
  enemy <- paste(y_pos, x_pos)

  # Load arena file as ascii art
  arena <- read.table(arena_filename, sep = " ", dec = ".")

  # Define a list of states from the arena.
  # These should be comma seperated string.
  states <- list()
  n_states <- 0
  for (row in 1:nrow(arena)) {
    for (col in 1:ncol(arena)) {
      if (arena[row, col] == 1) {
        states[[n_states + 1]] <- list(row = row, col = col)
        n_states <- n_states + 1
      }
    }
  }
  states_strings <- rep("", length(states))
  for (i in seq_along(states)) {
    states_strings[i] <- paste(states[[i]]$row, states[[i]]$col)
  }

  states <- states_strings

  # List with possible actions
  actions <- c("up", "right", "down", "left")

  # Combine states with actions and calculate the reward.
  # If the states becomes the position of the enemy, the reward is high.
  env <- function(state, action) {
    coord <- as.numeric(stringr::str_split(string = state, pattern = " ")[[1]])
    next_state <- state
    col <- coord[2]
    row <- coord[1]
    next_col <- coord[2]
    next_row <- coord[1]
    if (
      action == "down" &&
      row < nrow(arena) &&
      arena[row, col] == 1 &&
      arena[row + 1, col] == 1
    ) {
      next_row <- row + 1
    }
    if (
      action == "up" &&
      row > 1 &&
      arena[row, col] == 1 &&
      arena[row - 1, col] == 1
    ) {
      next_row <- row - 1
    }
    if (
      action == "right" &&
      col < ncol(arena) &&
      arena[row, col] == 1 &&
      arena[row, col + 1] == 1
    ) {
      next_col <- col + 1
    }
    if (
      action == "left" &&
      col > 1 &&
      arena[row, col] == 1 &&
      arena[row, col - 1] == 1
    ) {
      next_col <- col - 1
    }
    next_state <- paste(next_row, next_col)
    if (next_state == enemy && state != enemy) {
      reward <- 10
    } else {
      reward <- -1
    }
    list(NextState = next_state, Reward = reward)
  }

  # Parameters to send to AI library
  data <- ReinforcementLearning::sampleExperience(
    N = 1000,
    env = env,
    states = states,
    actions = actions
  )

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
  ReinforcementLearning::computePolicy(model)
}
