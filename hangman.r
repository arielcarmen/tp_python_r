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

  cat("Welcome to the Hangman game!\n")

  while (attempts < max_attempts) {
    current_hidden_word <- display_hidden_word(word_to_guess, correct_letters)
    cat("Current word: ", current_hidden_word, "\n")

    guess <- tolower(readline("Guess a letter: "))

    if (nchar(guess) != 1 || !grepl("[a-z]", guess)) {
      cat("Please enter a single valid letter.\n")
      next
    }

    if (guess %in% correct_letters) {
      cat("You've already guessed this letter. Try again.\n")
      next
    }

    if (guess %in% strsplit(word_to_guess, NULL)[[1]]) {
      cat("Good guess!\n")
      correct_letters <- c(correct_letters, guess)
    } else {
      cat("Wrong guess. Try again.\n")
      attempts <- attempts + 1
    }

    if (length(unique(correct_letters)) == length(unique(strsplit(word_to_guess, NULL)[[1]]))) {
      cat("Congratulations, you guessed the word:", word_to_guess, "\n")
      break
    }
  }

  if (attempts == max_attempts) {
    cat("Sorry, you've reached the maximum number of attempts. The word was:", word_to_guess, "\n")
  }
}

hangman()
