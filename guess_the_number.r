guess_the_number_game <- function() {
  number_to_guess <- sample(1:100, 1)
  attempts <- 0

  cat("Vous devez choisir un nombre entre 1 et 100.\n")

  while (TRUE) {
    user_guess <- as.integer(readline("Entrez votre choix: "))
    attempts <- attempts + 1

    if (user_guess < number_to_guess) {
      cat("Trop bas! Réessayez.\n")
    } else if (user_guess > number_to_guess) {
      cat("Trop bas! Réessayez.\n")
    } else {
      cat(sprintf("Félicitations! Vous avez deviné le mot après %d tentatives.\n", attempts))
      break
    }
  }
}

# Calling the function
guess_the_number_game()
