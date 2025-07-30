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

var adminPass = "123456789";
var adminUser = "Karan";
void main() {
  Library lib = Library();
  File logs = File("Logs.csv");
  // Load from database
  lib.loadItems();
  while (true) {
    stdout.write("1. Admin Login\n2. User login\n3. Exit\n> ");
    var loginInfo = stdin.readLineSync()!;
    if (loginInfo == "1") {
      stdout.write("Please enter your username!\n> ");
      var adminUsername = stdin.readLineSync()!;
      stdout.write("Please enter your password!\n> ");
      var adminPassword = stdin.readLineSync()!;
      if (adminPassword == adminPass && adminUsername == adminUser) {
        print("Access Granted! Welcome.");
        while (true) {
          stdout.write("1.Add new books.\n2.Add Magazines\n> ");
          var adminChoice = stdin.readLineSync()!;
          AdminPortal ap = AdminPortal(lib);
          if (adminChoice == "1") {
            stdout.write("Please enter the books name: ");
            var title = stdin.readLineSync()!;
            stdout.write("Please enter the books author name: ");
            var author = stdin.readLineSync()!;
            stdout.write("Please enter the books realse year: ");
            var year = int.parse(stdin.readLineSync()!);
            ap.addNewItemsBooks(title, author, year);
          } else if (adminChoice == "2") {
            stdout.write("Please enter the magazine name: ");
            var title = stdin.readLineSync()!;
            stdout.write("Please enter the magazine author name: ");
            var author = stdin.readLineSync()!;
            stdout.write("Please enter the magazine realse year: ");
            var year = int.parse(stdin.readLineSync()!);
            ap.addNewItemsMag(title, author, year);
          } else {
            throw Exception(
              "Something went wrong! Please enter a valid input.",
            );
          }
          stdout.write("Press 1 to continune or 2 to exit.\n> ");
          var adminSel = stdin.readLineSync()!;
          if (adminSel == "2") {
            print("Goodbye Admin!");
            break;
          } else if (adminSel == "1") {
            continue;
          } else {
            throw Exception("Something went wrong.");
          }
        }
      } else {
        throw Exception("Access not granted.");
      }
    } else if (loginInfo == "2") {
      stdout.write("Enter your name: ");
      var username = stdin.readLineSync()!;
      userInfo u = userInfo();
      u.username = username;
      print("Welcome $username!");
      option o = option();
      o.display();
      while (true) {
        stdout.write('Choose an option: ');
        var choice = stdin.readLineSync();
        if (choice == "1") {
          lib.displayAllItems();
        } else if (choice == "2") {
          stdout.write('Enter the title of the item to borrow: ');
          var title = stdin.readLineSync();
          if (title != null &&
              lib.items.any(
                (item) => item.title!.toLowerCase() == title.toLowerCase(),
              )) {
            lib.borrowItem(title);
            print("Processing...");
            print("✅ $username borrowed $title on ${DateTime.now()}");
            logs.writeAsStringSync(
              "\nBorrowed: $username, $title, ${DateTime.now()}",
              mode: FileMode.append,
            );
          } else {
            print("Book does not exists! Please try again.");
            break;
          }
        } else if (choice == "3") {
          stdout.write('Enter the title of the item to return: ');
          var title = stdin.readLineSync();
          if (title != null &&
              lib.items.any(
                (item) => item.title!.toLowerCase() == title.toLowerCase(),
              )) {
            lib.returnItem(title);
            print("Processing...");
            print("You returned the book $Book at ${DateTime.now()}");
            logs.writeAsStringSync(
              "\nReturned: $username, $title, ${DateTime.now()}",
              mode: FileMode.append,
            );
          } else {
            print(
              "Item doesn't exist or something went wrong! Please try again.",
            );
            break;
          }
        } else if (choice == "4") {
          print("Goodbye!");
          exit(0);
        } else {
          throw Exception("Invalid choice!");
        }
        stdout.write(
          "----------------------\nDo you want to run the file again? (Y/N)\n> ",
        );
        var option = stdin.readLineSync()!;
        if (option.toUpperCase() == "Y") {
          o.display();
        } else {
          break;
        }
      }
    } else if (loginInfo == "3") {
      print("Thank you for using our application! Come back soon again :)");
      exit(0);
    } else {
      throw Exception("Something went wrong!");
    }
  }
}
