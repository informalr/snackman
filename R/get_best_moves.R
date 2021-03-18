#' Get best moves
#'
#' This function uses reinforcement learning to determine the best moves
#' for a ghost for every position in the arena, taking into account the
#' position of the player.
#'
#' @param player Player
#' @param arena Arena.
#' @return Named character vector with best moves for every position in the
#' arena.
#' @export
get_best_moves <- function(player, arena) {
  # Get states
  rows <- which(arena$layout == 1) %% nrow(arena$layout)
  rows <- ifelse(rows == 0, nrow(arena$layout), rows)
  cols <- ceiling(which(arena$layout == 1) / nrow(arena$layout))
  states <- sort(paste(rows, cols, sep = " "))

  # Combine states with actions and calculate the reward.
  # If the states becomes the position of the enemy, the reward is high.
  env <- function(state, action) {
    enemy <- paste(player$y, player$x)
    pos <- as.numeric(stringr::str_split(string = state, pattern = " ")[[1]])
    row <- pos[1]
    col <- pos[2]

    delta <- switch(action,
                    "down"  = c(1, 0),
                    "up"    = c(-1, 0),
                    "left"  = c(0, -1),
                    "right" = c(0, 1)
    )

    next_row <- row + delta[1]
    next_col <- col + delta[2]

    if (
      arena$layout[next_row, next_col] == 1 &&
      next_row %in% seq_len(nrow(arena$layout)) &&
      next_col %in% seq_len(ncol(arena$layout))
    ) {
      next_state <- paste(next_row, next_col)
    } else {
      next_state <- state
    }

    if (next_state == enemy && state != enemy) {
      reward <- 10
    } else if (next_state != state) {
      reward <- 1
    } else {
      reward <- -100 # Penalize moves that are not allowed
    }

    list(NextState = next_state, Reward = reward)
  }

  # Parameters to send to AI library
  actions <- c("up", "right", "down", "left")
  data <- ReinforcementLearning::sampleExperience(N = 1000,
                                                  env = env,
                                                  states = states,
                                                  actions = actions)

  # Define reinforcement learning parameters
  control <- list(alpha = 0.1, gamma = 0.5, epsilon = 0.1)

  # Perform reinforcement learning
  model <- ReinforcementLearning::ReinforcementLearning(data,
                                                        s = "State",
                                                        a = "Action",
                                                        r = "Reward",
                                                        s_new = "NextState",
                                                        control = control)

  # Return policy
  ReinforcementLearning::computePolicy(model)
}
