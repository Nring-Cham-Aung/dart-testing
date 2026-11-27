

import 'dart:io';

class Database {

  static Database? _instant;

  static Database get instant {
    if(_instant == null){
      print('DB is not initialized!');
      exit(1);
    }
    return _instant!;
  }

  String _path;

  int currentId = 0;

  Database._private(this._path);

  void showPath() => print('DB path : $_path');

  factory Database(String path){
    // if(_instant == null){
    //   _instant = Database._private(path);
    // }
    _instant??=Database._private(path);
    return _instant!;
  }
  
}




class Car {

  static Car? _instant;

  static Car get instant => _instant!;

  String _brandName;
  int _model;

  Car._private(this._brandName, this._model);
  
  factory Car(String barand, int model) {
    if(_instant == null){
      _instant = Car._private(barand,model);
    }
    return _instant!;
  }

  String getInfo () => '$_brandName $_model model';

  void showInfo () {
    print('Brand : $_brandName');
    print('Model : $_model');
  }
  
}


// void main(){
//   final car = Car('Toyota', 2026);
//   print(car.getInfo());

//   home();

// }

// void home(){
//   final car = Car('Malibu', 2025);
//   car.showInfo();
// }



