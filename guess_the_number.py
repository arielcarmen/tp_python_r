import random

def guess_the_number_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0

    print("Welcome to the Guess the Number game!")
    print("Guess the number between 1 and 100.")

    while True:
        user_guess = int(input("Enter your guess: "))
        attempts += 1

        if user_guess < number_to_guess:
            print("Too small! Try again.")
        elif user_guess > number_to_guess:
            print("Too large! Try again.")
        else:
            print(f"Congratulations! You guessed the number in {attempts} attempts.")
            break

if __name__ == "__main__":
    guess_the_number_game()
