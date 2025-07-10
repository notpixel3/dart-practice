// Write a program in Dart to calculate power of a certain number. For e.g 5^3=125
import 'dart:math';
import 'dart:io';

int power(int num, int power) {
  return pow(num, power).toInt();
}

void main() {
  stdout.write("Enter a number\n> ");
  int number = int.parse(stdin.readLineSync()!);
  stdout.write("Enter an exponent\n> ");
  int expo = int.parse(stdin.readLineSync()!);
  print("$number^$expo=${power(number, expo)}");
}
