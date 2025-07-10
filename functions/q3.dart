// Write a program in Dart that find the area of a circle using function. Formula: pi * r * r
import 'dart:io';
import 'dart:math';

double circleFormula(double radius) {
  return pi * radius * radius;
}

void main() {
  stdout.write("Enter the radius\n> ");
  double area = circleFormula(double.parse(stdin.readLineSync()!));
  print("The area of the circle is: $area ≈ ${area.round()}");
}
