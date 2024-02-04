import random

def guess_the_number_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0

    print("Nouvelle partie de Plus ou moins!")
    print("Vous devez deviner un nombre entre 0 et 100.")

    while True:
        user_guess = int(input("Entrez votre choix: "))
        attempts += 1

        if user_guess < number_to_guess:
            print("Trop bas! Réessayez.")
        elif user_guess > number_to_guess:
            print("Trop haut! Réessayez.")
        else:
            print(f"Félicitations! vous avez trouvé le mot après {attempts} tentatives.")
            break

if __name__ == "__main__":
    guess_the_number_game()
