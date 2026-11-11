import 'dart:io';



List<Map<String,String>> users = [];

String backKey = 'Exit';

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
    if(selectedNum == null) {
      exit();
      return;
    }
  } while (!actions.keys.contains(selectedNum));

  switch (selectedNum) {
    case 1:
      register();
      break;
    case 2:
      login();
      break;
    case 3:
      showUsers();
      break;
    case 4:
      exit();
      break;
    default:
  }

}

int? getChoose([bool retry = false]){
  stdout.write('Select a ${retry? 'valid ':''}number : ');
  String? val = stdin.readLineSync();
  if(val == backKey) return null;
  return int.tryParse(val??'')?? 0;
}

String? getString(String lable, [bool retry = false]){
  if(retry) print('Please write a valid $lable');
  stdout.write('$lable: ');
  String? val = stdin.readLineSync();
  if(val == backKey) return null;
  return (val??'').trim();
}

// action 1
void register(){
  String? username;
  do {
    username = getString('Username', username != null);
    if(username == null){
      exit();
      return;
    }
  } while (username.length<3);

  bool isExists = users.map((mv)=>mv['username']).contains(username);
  if(isExists){
    print('\n$username is already exists!');
    print('Please use another one!\n');
    register();
    return;
  }

  String? password;
  do {
    password = getString('Password', password != null);
    if(password == null){
      exit();
      return;
    }
  } while (password.length<3);
  
  users.add({'username': username, 'password': password});
  print('--------------------------------');
  print('A user successfully registered!');
  print('--------------------------------\n\n');
  mainMenu();
}

// action 2
void login(){
  print('Please login with your account!');
  String? username = getString('Username');

  Map<String,String>? user;

  for (var u in users) {
    if(u['username']==username){
      user = u;
      break;
    }
  }

  if(user == null){
    print("\nInvalid username!");
    if (backToMain(username==null)) return;
    login();
    return;
  }

  String? password;

  do {
    if(password != null) print('\nInvalid password!');
    if(backToMain(password == null)) return;
    password = getString('Password');
    if(password == null){
      exit();
      return;
    }
  } while (password != user['password']);
  
  print('\n\n--------------------------\n--------------------------');
  print('Hi ${user['username']}\nWelcome from home page!');
  print('--------------------------\n\n');

  int? choose;
  do {
    print('\n\n1.Logout\n2.Exit from application\n');
    choose = getChoose(choose != null);
    if(choose == null){
      exit();
      return;
    }
  } while (![1,2].contains(choose));

  if(choose==1){
    print('Logging out.....done!\n\n');
    mainMenu();
    return;
  }
  exit();
}

// action 3
void showUsers(){
  print('---------------All User-----------------');
  print(users.map((m)=>{'username':m['username'], 'password':'*****'}).toList());
  print('--------------------------------\n\n');
  mainMenu();
}

// action 4
void exit(){
  print('See you next time!\nBye.....!\n');
}

bool backToMain(bool value){
  print('Write "$backKey" to back to main menu!\n');
  if(value){
    mainMenu();
    return true;
  }
  return false;
}

