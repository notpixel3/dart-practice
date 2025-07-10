// Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.
import 'dart:io';

void createUser(String name, int age, {bool isActive = true}) {
  print("Name: $name \nAge: $age years old  \nStatus: $isActive");
}

void main() {
  stdout.write("Enter your name\n> ");
  String namef = stdin.readLineSync()!;
  stdout.write("Enter your age\n> ");
  int agef = int.parse(stdin.readLineSync()!);
  createUser(namef, agef);
}
