import random

def choose_word():
    words = ["python", "programming", "game", "hangman", "computer", "learning"]
    return random.choice(words)

def display_hidden_word(word, correct_letters):
    hidden_word = ""
    for letter in word:
        if letter in correct_letters:
            hidden_word += letter
        else:
            hidden_word += "_"
    return hidden_word

def hangman():
    word_to_guess = choose_word()
    correct_letters = []
    max_attempts = 6
    attempts = 0

    print("Welcome to the Hangman game!")

    while attempts < max_attempts:
        current_hidden_word = display_hidden_word(word_to_guess, correct_letters)
        print("Current word: ", current_hidden_word)

        guess = input("Guess a letter: ").lower()

        if len(guess) != 1 or not guess.isalpha():
            print("Please enter a single valid letter.")
            continue

        if guess in correct_letters:
            print("You've already guessed this letter. Try again.")
            continue

        if guess in word_to_guess:
            print("Good guess!")
            correct_letters.append(guess)
        else:
            print("Wrong guess. Try again.")
            attempts += 1

        if set(correct_letters) == set(word_to_guess):
            print("Congratulations, you guessed the word:", word_to_guess)
            break

    if attempts == max_attempts:
        print("Sorry, you've reached the maximum number of attempts. The word was:", word_to_guess)

if __name__ == "__main__":
    hangman()
