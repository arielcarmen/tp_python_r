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

    print("Nouvelle partie :")

    while attempts < max_attempts:
        current_hidden_word = display_hidden_word(word_to_guess, correct_letters)
        print("Mot à deviner: ", current_hidden_word)

        guess = input("Entrez une lettre: ").lower()

        if len(guess) != 1 or not guess.isalpha():
            print("Entrez une lettre de l'alphabet!")
            continue

        if guess in correct_letters:
            print("Vous avez déja entré cette lettre. Réessayez.")
            continue

        if guess in word_to_guess:
            print("Correct!")
            correct_letters.append(guess)
        else:
            print("Mauvais choix. Réessayez.")
            attempts += 1

        if set(correct_letters) == set(word_to_guess):
            print("Félictations, vous avez trouvé:", word_to_guess)
            break

    if attempts == max_attempts:
        print("GAME OVER. Le mot était:", word_to_guess)

if __name__ == "__main__":
    hangman()
