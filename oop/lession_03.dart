

// const constructor

class Shape {
  final int x, y;
  const Shape(this.x, this.y);
  void showArea(){
    print("The area is ${x*y}");
  }
}

void main(){
  const shape1 = Shape(60, 40);
  const shape2 = Shape(60, 40);

  print(shape1.hashCode);
  print(shape2.hashCode);

  print(shape1 == shape2);

}

