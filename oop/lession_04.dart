

// Scope [Private class & properties]


import 'dart:math';

class _Circle{
  final int radius;
  const _Circle(this.radius);
  void showDiameter(){
    print("D: ${radius*2}");
  }
}

class _Square{
  final int size;
  const _Square(this.size);
}


class Shape{
  final int _x, y;
  const Shape(this._x, this.y);

  void showArea(){
    print("Area: ${_x*y} sqft");
  }

  _Circle circle () => _Circle((min(_x, y)/2).toInt());

  _Square square () => _Square(min(_x, y));

  
}



void main(){

  const shape = Shape(60, 40);

  shape.showArea();

  print('X: ${shape._x}');
  print('Y: ${shape.y}');


}

