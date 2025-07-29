import 'dart:io';
import 'Rooms.dart';
void main() {
  print("Instructions: Please enter all the data correctly!");
  List<Room> data = [];
  print("How many rooms do you want to enter?");
  int n = int.parse(stdin.readLineSync()!);
  double totalArea = 0;
  double largest = -1;
  double smallest = double.infinity;
  String largestRoom = '';
  String smallestRoom = '';
  for (int i = 0; i < n; i++) {
    stdout.write("Please enter the room ${i + 1} name\n> ");
    String name = stdin.readLineSync()!;
    stdout.write("Please enter the $name's length\n> ");
    double length = double.parse(stdin.readLineSync()!);
    stdout.write("Please enter the $name's width\n> ");
    double width = double.parse(stdin.readLineSync()!);
    Room room = Room(name, length, width);
    data.add(room);
    totalArea += room.area!;
    if (room.area! > largest) {
      largest = room.area!;
      largestRoom = room.name!;
    }
    if (room.area! < smallest) {
      smallest = room.area!;
      smallestRoom = room.name!;
    }
  }
   print("\n-- Rooms Data --");
  for (Room r in data) {
    r.display();
  }

  print("Total Area: ${totalArea.toStringAsFixed(2)}");
  print("Largest Room: $largestRoom (${largest.toStringAsFixed(2)} m²)");
  print("Smallest Room: $smallestRoom (${smallest.toStringAsFixed(2)} m²)");
}