

import 'dart:io';

List<Map<String,dynamic>> accounts = [
  {
    'acc_name': 'Rkcoder',
    'acc_no': '0100123123',
    'password': 'Barlarlar',
    'balance': 5000,
    'history': [
      {
        'type' : 'cash-in',
        'amount': 8000
      },
      {
        'type' : 'cash-out',
        'amount': 3000
      }
    ]
  },
  {
    'acc_name': 'Joker',
    'acc_no': '0100123124',
    'balance': 1500,
    'password': 'no need pass',
    'history': [
      {
        'type' : 'cash-in',
        'amount': 1000
      },
      {
        'type' : 'cash-in',
        'amount': 500
      }
    ]
  },
];



void main(){
  welcomeMessage();
  runApp();
}

void runApp (){
  int choosed = mainMenu(false);

  while (![1,2,3,4].contains(choosed)) {
    choosed = mainMenu(true);
  }

  switch (choosed) {
    case 1:
      checkBalance();
      break;
    default:
      print('Not implemnted!');
  }
}

void welcomeMessage(){
  print('\n\n\n');
  print("--------------------------");
  print('Welcome from Arakha Bank');
  print("--------------------------");
}

int mainMenu(bool retry){
  List<String> actions = ['Check balance', 'Cash in', 'Cash out', 'Exit'];
  String menu = '';
  for (var i = 0; i < actions.length; i++) {
    menu += '${i+1}.${actions[i]}\n';
  }
  print(menu);
  return getChoose(retry);
}


void checkBalance(){
  Map<String,dynamic>? account;
  bool retry = false;
  do {
    account = getAccount(retry);
    retry = true;
  } while (account==null);

  retry = false;
  bool confirmed = false;
  do {
    confirmed = confirmPassword(account['password'], retry);
    retry = true;
  } while (!confirmed);

  print('\n\n');
  print('Account details');
  print('---------------------');
  print('${account['acc_name']}');
  print('${account['acc_no']}');
  print('${account['balance']} ks\n\n');

  runApp();

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

Map<String,dynamic>?  getAccount(bool retry){
  final accNo = getString('Account no', retry);
  Map<String,dynamic>? account;
  for (var acc in accounts) {
    if(acc['acc_no']==accNo){
      account = acc;
      break;
    }
  }
  return account;
}

bool confirmPassword(String password,  bool retry){
  String pass = getString('Password', retry);
  return pass == password;
}


