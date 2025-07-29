class Room {
  String? name;
  double? length;
  double? width;
  double? area;
  Room(this.name, this.length, this.width){
    area = length! * width!;
  }
  void display() {
    print("Room Name: $name\nArea of the Room: $area\n");
  }
}
