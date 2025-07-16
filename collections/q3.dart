// Create a simple to-do application that allows user to add, remove, and view their task.
import 'dart:io';

String action = '';
String addActions() {
  stdout.write(
    "Type /view to get view your To-Do list.\nType /add to add a task.\nType /remove to remove a task\nType /exit to exit the app.\n> ",
  );
  String action = stdin.readLineSync()!;
  return action;
}
void main() {
  print("Welcome to To-Do List Application!");
  String addAction = '';
  String action = addActions();
  List<String> todo = [];
  while (action != "/exit") {
    if (action == "/add") {
      stdout.write("Enter the task you want to add\n> ");
      String add = stdin.readLineSync()!;
      todo.add(add);
      stdout.write("Do you want to enter another task?(Y/N)\n> ");
      addAction = stdin.readLineSync()!;
      if (addAction.toUpperCase() == "N") {
        action = addActions();
      } else if (addAction.toUpperCase() == "Y") {
        action = "/add";
        continue;
      } else {
        print("Something went wrong!");
        action = addActions();
      }
    } else if (action == "/remove") {
      stdout.write(
        "Which task do you want to remove? Enter a number to remove that task!\n> ",
      );
      int removeNum = int.parse(stdin.readLineSync()!);
      todo.removeAt(removeNum - 1);
      stdout.write("Do you want to remove another task? (Y/N)\n> ");
      addAction = stdin.readLineSync()!;
      if (addAction.toUpperCase() == "N") {
        action = addActions();
      } else if (addAction.toUpperCase() == "Y") {
        action = "/remove";
        continue;
      } else {
        print("Something went wrong!");
        action = addActions();
      }
    } else if (action == "/view") {
      for (int i = 0; i < todo.length; i++) {
        print("Here is list of all your tasks:\n${i + 1}. ${todo[i]}");
      }
      action = addActions();
    }
  }
}
