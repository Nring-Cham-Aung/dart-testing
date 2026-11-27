class Rectangle {
  double width, height;
  // Main constructor
  Rectangle(this.width, this.height);
  // Redirecting constructor
  Rectangle.square(double side) : this(side, side);
  
}

void main() {
  var square = Rectangle.square(4);
  print("Width: ${square.width}, Height: ${square.height}");
}
