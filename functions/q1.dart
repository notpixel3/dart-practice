// Write a program in Dart to print even numbers between intervals using function.
import "dart:io";

void even(int num1, int num2) {
  if (num1 % 2 != 0) {
    num1 = num1 + 1;
  }
  while (num1 <= num2) {
    print(num1);
    num1 = num1 + 2;
  }
}

void main() {
  stdout.write("Enter boundary one\n> ");
  int bound1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter boundary two\n> ");
  int bound2 = int.parse(stdin.readLineSync()!);
  even(bound1, bound2);
}
