

import 'dart:io';

class User {
  String name;
  String password;

  User(this.name, this.password);

  String normalize () => "{username: $name, password: *****}";

}

List<User> users = [];

void main() {
  print('------------');
  print('Welcome!');
  print('------------');
  mainMenu();
  
}

void mainMenu(){
  Map<int,String> actions = {1: 'Register', 2: 'Login', 3: 'Show users', 4: 'Exit'};
  print(actions.entries.map((e)=>'${e.key}.${e.value}').join('\n'));
  int? selectedNum;
  do {
    if(selectedNum != null) print('Invalid number!');
    selectedNum = getChoose(selectedNum != null);
  } while (!actions.keys.contains(selectedNum));

  switch (selectedNum) {
    case 1:
      register();
      break;
    case 3:
      showUsers();
      break;
    default:
  }

}



// action 1
void register(){
  String? username;
  do {
    username = getString('Username', username != null);
  } while (username.length<3);

  bool isExists = users.map((u)=>u.name).contains(username);
  if(isExists){
    print('\n$username is already exists!');
    print('Please use another one!\n');
    register();
    return;
  }

  String password;
  do {
    password = getString('Password');
  } while (password.length<3);
  
  users.add(User(username, password));
  print('--------------------------------');
  print('A user successfully registered!');
  print('--------------------------------\n\n');
  mainMenu();
}





// action 3
void showUsers(){
  print('---------------All User-----------------');
  print(users.map((m)=>m.normalize()).toList());
  print('--------------------------------\n\n');
  mainMenu();
}



int getChoose([bool retry = false]){
  stdout.write('Select a ${retry? 'valid ':''}number : ');
  String? val = stdin.readLineSync();
  return int.tryParse(val??'')?? 0;
}

String getString(String lable, [bool retry = false]){
  if(retry) print('Please write a valid $lable');
  stdout.write('$lable: ');
  String? val = stdin.readLineSync();
  return (val??'').trim();
}
