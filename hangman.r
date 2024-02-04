choose_word <- function() {
  words <- c("python", "programming", "game", "hangman", "computer", "learning")
  return(sample(words, 1))
}

display_hidden_word <- function(word, correct_letters) {
  hidden_word <- ""
  for (letter in strsplit(word, NULL)[[1]]) {
    if (letter %in% correct_letters) {
      hidden_word <- paste(hidden_word, letter, sep="")
    } else {
      hidden_word <- paste(hidden_word, "_", sep="")
    }
  }
  return(hidden_word)
}

hangman <- function() {
  word_to_guess <- choose_word()
  correct_letters <- character(0)
  max_attempts <- 6
  attempts <- 0

  cat("Jeu du pendu, nouvelle partie\n")

  while (attempts < max_attempts) {
    current_hidden_word <- display_hidden_word(word_to_guess, correct_letters)
    cat("Mot à deviner: ", current_hidden_word, "\n")

    guess <- tolower(readline("Entrez une lettre: "))

    if (nchar(guess) != 1 || !grepl("[a-z]", guess)) {
      cat("Entrez une lettre de l'alphabet.\n")
      next
    }

    if (guess %in% correct_letters) {
      cat("Vous avez déja entré cette lettre! Réessayez.\n")
      next
    }

    if (guess %in% strsplit(word_to_guess, NULL)[[1]]) {
      cat("Bien joué!\n")
      correct_letters <- c(correct_letters, guess)
    } else {
      cat("Mauvais choix. Réessayez.\n")
      attempts <- attempts + 1
    }

    if (length(unique(correct_letters)) == length(unique(strsplit(word_to_guess, NULL)[[1]]))) {
      cat("Félicitation, vous avez trouvé le mot:", word_to_guess, "\n")
      break
    }
  }

  if (attempts == max_attempts) {
    cat("GAME OVER! Le mot était:", word_to_guess, "\n")
  }
}

hangman()
