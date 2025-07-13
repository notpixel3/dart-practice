/* Advance Guessing Game (Bonus code 1) */
import 'dart:io';
import 'dart:math';

int won = 0;
int totalGames = 0;
String name = '';
String diff = '';
int getGuess() {
  stdout.write("Please enter a number to guess\n> ");
  return int.parse(stdin.readLineSync()!);
}

void game(int num) {
  Random random = Random();
  int value = random.nextInt(num) + 1;
  int chance = 3;
  totalGames++;
  while (chance > 0) {
    int guess = getGuess();
    if (guess == value) {
      print("Yay you won!");
      won++;
      return;
    } else {
      chance--;
      if (chance > 0) {
        print("Try again! $chance chances left.");
      }
    }
  }
  print("You lost! The number was $value.");
}

void main() {
  stdout.write("Enter your name\n> ");
  name = stdin.readLineSync()!;
  while (true) {
    stdout.write(
      "Welcome to the guessing game, $name!\nChoose a difficulty\n(1-10) Easy\n(1-50) Hard\n(1-100) Extra Hard\n> ",
    );
    diff = stdin.readLineSync()!;
    if (diff.toUpperCase() == "EASY") {
      game(10);
    } else if (diff.toUpperCase() == "HARD") {
      game(50);
    } else if (diff.toUpperCase() == "EXTRA HARD") {
      game(100);
    }
    print('👤 Name: $name\n🎮 Games Played: $totalGames\n🏆 Games Won: $won\n📊 Difficulty: $diff');
    stdout.write("Do you want to play again? Y/N\n> ");
    String agree = stdin.readLineSync()!;
    if (agree.toUpperCase() == 'Y') {
      continue;
    } else if (agree.toUpperCase() == 'N') {
      print("Thank you for playing!");
      break;
    } else {
      print("Something went wrong. Thank you for using our service!");
      break;
    }
  }
}