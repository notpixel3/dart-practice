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

class Book extends LibraryItems {
  @override
  void displayInfo() {
    super.displayInfo();
    print("Type: Book");
  }
}

class Magazine extends LibraryItems {
  @override
  void displayInfo() {
    super.displayInfo();
    print("Type: Magazine");
  }
}

enum ItemStatus { available, borrowed }

class Library {
  List<LibraryItems> items = [];
  Map<LibraryItems, ItemStatus> statusMap = {};

  // add Items in the Library
  void addItems(LibraryItems item) {
    items.add(item);
    statusMap[item] = ItemStatus.available;
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
        break;
      }
    }
  }
}