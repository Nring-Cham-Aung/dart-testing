

import 'lession_05.dart';

void main(){
  Database('app.db');
  Car('Malibu', 2020);
  home();
}

void home(){

  Database.instant.showPath();
  Database.instant.currentId = 40;
  details();
}

void details(){
  print('Current id : ${Database.instant.currentId}');
  Car.instant.showInfo();
}