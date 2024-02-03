guess_the_number_game <- function() {
  number_to_guess <- sample(1:100, 1)
  attempts <- 0

  cat("Welcome to the Guess the Number game!\n")
  cat("Guess the number between 1 and 100.\n")

  while (TRUE) {
    user_guess <- as.integer(readline("Enter your guess: "))
    attempts <- attempts + 1

    if (user_guess < number_to_guess) {
      cat("Too small! Try again.\n")
    } else if (user_guess > number_to_guess) {
      cat("Too large! Try again.\n")
    } else {
      cat(sprintf("Congratulations! You guessed the number in %d attempts.\n", attempts))
      break
    }
  }
}

# Calling the function
guess_the_number_game()
