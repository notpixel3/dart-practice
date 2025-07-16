// Write a program that prompts the user to enter a list of expense amounts.
//After all expenses are entered, the program should calculate and display the total expense.
import 'dart:io';

void main() {
  stdout.write("Enter total number of expenses: ");
  int numberOfExpense = int.parse(stdin.readLineSync()!);
  int x = 0;
  int total = 0;
  List<int> expenses = [];
  while (x < numberOfExpense) {
    stdout.write("Enter expense ${x+1}\n\$");
    int exp = int.parse(stdin.readLineSync()!);
    total = total + exp;
    expenses.add(exp);
    x++;
  }
  print(
    'Number of expenses: $numberOfExpense\nAll values: $expenses\nTotal: $total',
  );
}
