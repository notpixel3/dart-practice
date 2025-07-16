/*Write a Dart program that asks the user how many friends they want to add, then prompts them to enter each friend’s name. 
After all names are entered, the program should ask the user to enter a starting alphabet.
The program should then use the where method to filter and display all names that start with that alphabet.*/
import 'dart:io';

void main() {
  stdout.write("How many friends do you want to add?\n> ");
  int totalNum = int.parse(stdin.readLineSync()!);
  List<String> names = [];
  for (int i = 0; i < totalNum; i++) {
    stdout.write("Enter name of friend ${i + 1}: ");
    String name = stdin.readLineSync()!;
    names.add(name);
  }
  stdout.write("Enter a starting alphabet to filter:\n> ");
  String alphabet = stdin.readLineSync()!;
  List<String> namesFiltered = names.where((e) => e.startsWith(alphabet)).toList();
  print("List of all friends: $names\nStarting with $alphabet: $namesFiltered");
}