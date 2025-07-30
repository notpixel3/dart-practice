import 'dart:io';
import 'dart:math';

// Main print class
class LibraryItems {
  String? title;
  String? author;
  int? year;
  void displayInfo() {
    print("----------------------");
    print("Title: $title");
    print("Author: $author");
    print("Publication Year: $year");
  }
}

// Books Addition
class Book extends LibraryItems {
  @override
  void displayInfo() {
    super.displayInfo();
    print("Type: Book");
  }
}

// Magazine Addition
class Magazine extends LibraryItems {
  @override
  void displayInfo() {
    super.displayInfo();
    print("Type: Magazine");
  }
}

// User info
class userInfo {
  String? _username;
  // Getter
  String get username => this._username!;
  // Setter
  set username(String name) {
    if (name == "") {
      throw Exception("Please enter a valid name");
    } else {
      this._username = name;
    }
  }
}

// Main Logic
enum ItemStatus { available, borrowed }

class Library {
  File file = File("Database.csv");
  List<LibraryItems> items = [];
  Map<LibraryItems, ItemStatus> statusMap = {};

  // add Items in the Library
  void addItems(LibraryItems item) {
    items.add(item);
    statusMap[item] = ItemStatus.available;
  }

  // Load information from Database
  void loadItems() {
    List<String> lines = file.readAsLinesSync();
    for (int i = 1; i < lines.length; i++) {
      var parts = lines[i].split(',');
      var status = parts[0].trim();
      var title = parts[1].trim();
      var author = parts[2].trim();
      int year = int.parse(parts[3].trim());
      var type = parts[4].trim();
      LibraryItems item;
      if (type == "Book") {
        item = Book();
      } else if (type == "Magazine") {
        item = Magazine();
      } else {
        continue;
      }
      item.title = title;
      item.author = author;
      item.year = year;
      items.add(item);
      if (status == "Available") {
        statusMap[item] = ItemStatus.available;
      } else {
        statusMap[item] = ItemStatus.borrowed;
      }
    }
    print("✅ Library loaded from database successfully.");
  }

  // display all the information of the items
  void displayAllItems() {
    for (var item in items) {
      item.displayInfo();
      if (statusMap[item] == ItemStatus.available) {
        print("Status: Available🟢");
      } else if (statusMap[item] != ItemStatus.available) {
        print("Status: Borrowed🔴");
      }
    }
  }

  // Borrow Items
  void borrowItem(String title) {
    for (var item in items) {
      if (item.title == title && statusMap[item] == ItemStatus.available) {
        statusMap[item] = ItemStatus.borrowed;
        print("You borrowed '${item.title}'.\n");
        List<String> lines = file.readAsLinesSync();
        for (int i = 0; i < lines.length; i++) {
          if (lines[i].contains(item.title!)) {
            var parts = lines[i].split(',');
            parts[0] = "Borrowed";
            lines[i] = parts.join(',');
            break;
          }
        }
        file.writeAsStringSync(lines.join('\n'));
      } else if (item.title == title &&
          statusMap[item] != ItemStatus.available) {
        print("🔴Sorry, '${item.title}' is already borrowed.");
      } else {}
    }
  }

  // Return item
  void returnItem(String title) {
    bool found = false;
    for (var item in items) {
      if (item.title == title && statusMap[item] == ItemStatus.borrowed) {
        statusMap[item] = ItemStatus.available;
        print("You returned: '${item.title}'.");
        found = true;
        List<String> lines = file.readAsLinesSync();
        for (int i = 0; i < lines.length; i++) {
          if (lines[i].contains(item.title!)) {
            var parts = lines[i].split(',');
            parts[0] = "Available";
            lines[i] = parts.join(',');
            break;
          }
        }
        file.writeAsStringSync(lines.join('\n'));
        break;
      }
    }
  }
}

// Admin Portal
class AdminPortal {
  final Library library;
  AdminPortal(this.library);
  File file = File("Database.csv");

  // Add New Books
  void addNewItemsBooks(String title, String author, int year) {
    Book adminAddBook = Book();
    adminAddBook.title = title;
    adminAddBook.author = author;
    adminAddBook.year = year;
    library.addItems(adminAddBook);
    file.writeAsStringSync(
      '\nAvailable, $title, $author, $year, Book',
      mode: FileMode.append,
    );
  }

  // Add new Magazines
  void addNewItemsMag(String title, String author, int year) {
    Magazine adminAddMag = Magazine();
    adminAddMag.title = title;
    adminAddMag.author = author;
    adminAddMag.year = year;
    library.addItems(adminAddMag);
    file.writeAsStringSync(
      '\nAvailable, $title, $author, $year, Magazine',
      mode: FileMode.append,
    );
  }
}
