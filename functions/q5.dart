// Write a program in Dart to reverse a String using function.
import 'dart:io';

String reverseString(String input) {
  return input.split('').reversed.join("");
}

void main() {
  stdout.write("Enter something to reverse it\n> ");
  String org = stdin.readLineSync()!;
  String reverse = reverseString(org);
  print("Orignal: $org\nReversed: $reverse");
}
