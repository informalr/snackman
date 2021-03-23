#' Train AI model
#'
#' This function uses reinforcement learning to train a model to predict the
#' best move for a ghost, taking into account the position of the player.
#'
#' @details The trained model is saved as a `.rda` file in the `data` map:
#' `usethis::use_data(ai_model, internal = TRUE, overwrite = TRUE)`
#'
#' @param player Player
#' @param arena Arena.
#' @return Reinforcement learning model predicting the best next move.
#' @export
#' @md
#' @examples
#' player <- create_test_player()
#' arena <- create_test_arena()
#' ai_model <- train_ai_model(player, arena)
#' # Display the best possible action in every state
#' ReinforcementLearning::computePolicy(ai_model)
#' # Write state-action table to the screen
#' print(ai_model)
#' # Additional diagnostics regarding the model
#' summary(ai_model)
#' # Apply the model to predict best move
#' predict(ai_model, "3 4")
train_ai_model <- function(player, arena) {
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
  return(model)
}
