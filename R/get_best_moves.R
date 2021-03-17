#' Get best moves
#'
#' This function uses reinforcement learning to determine the best moves
#' for a player for every position in the arena, taking into account the
#' position of the enemy.
#'
#' @param x_pos x position of the enemy in the arena.
#' @param y_pos y position of the enemy in the arena.
#' @param arena Arena.
#' @details See https://cran.r-project.org/web/packages/ReinforcementLearning/
#' vignettes/ReinforcementLearning.html
#' @return Named character vector with best moves for every position in the
#' arena, taking into account the position of the enemy.
#' @export
get_best_moves <- function(x_pos, y_pos, arena) {
  # Get states
  rows <- which(arena$layout == 1) %% nrow(arena$layout)
  rows <- ifelse(rows == 0, nrow(arena$layout), rows)
  cols <- ceiling(which(arena$layout == 1) / nrow(arena$layout))
  states <- sort(paste(rows, cols, sep = " "))

  # Combine states with actions and calculate the reward.
  # If the states becomes the position of the enemy, the reward is high.
  env <- function(state, action) {
    enemy <- paste(y_pos, x_pos)
    pos <- as.numeric(stringr::str_split(string = state, pattern = " ")[[1]])
    row <- pos[1]
    col <- pos[2]
    next_state <- state

    if (arena$layout[row, col] == 1) {
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
      }
    }

    if (next_state == enemy && state != enemy) {
      reward <- 10
    } else {
      reward <- -1
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

  # Print policy
  ReinforcementLearning::computePolicy(model)
}
