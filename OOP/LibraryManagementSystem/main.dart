import 'dart:io';
import 'library.dart';

class option {
  void display() {
    print('--- Library System ---');
    print('1. View all items');
    print('2. Borrow an item');
    print('3. Return an item');
    print('4. Exit');
  }
}

void main() {
  Library lib = Library();
  option o = option();
  // Adding items
  var book1 = Book();
  book1.title = "Harry Potter";
  book1.author = "JK rolling";
  book1.year = 1970;
  var mag1 = Magazine();
  mag1.title = "National Geographic";
  mag1.author = "Various";
  mag1.year = 2022;
  var book2 = Book();
  book2.title = "1984";
  book2.author = "George Orwell";
  book2.year = 1949;

  lib.addItems(book1);
  lib.addItems(book2);
  lib.addItems(mag1);
  o.display();
  while (true) {
    stdout.write('Choose an option: ');
    var choice = stdin.readLineSync();
    if (choice == "1") {
      lib.displayAllItems();
      stdout.write("Do you want to run the file again? (Y/N)\n> ");
      var option = stdin.readLineSync();
      if (option == "Y") {
        o.display();
      } else {
        break;
      }
    } else if (choice == "2") {
      stdout.write('Enter the title of the item to borrow: ');
      var title = stdin.readLineSync();
      if (title != null) {
        lib.borrowItem(title);
      }
      stdout.write("Do you want to run the file again? (Y/N)\n> ");
      var option = stdin.readLineSync();
      if (option == "Y") {
        o.display();
      } else {
        break;
      }
    } else if (choice == "3") {
      stdout.write('Enter the title of the item to return: ');
      var title = stdin.readLineSync();
      if (title != null) {
        lib.returnItem(title);
      }
      stdout.write("Do you want to run the file again? (Y/N)\n> ");
      var option = stdin.readLineSync();
      if (option == "Y") {
        o.display();
      } else {
        break;
      }
    } else if (choice == "4") {
      print("Goodbye!");
      break;
    } else {
      print("Invalid choice!");
    }
  }
}
