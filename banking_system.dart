

import 'dart:io';

List<Map<String,dynamic>> accounts = [
  {
    'acc_name': 'Rkcoder',
    'acc_no': '123',
    'password': 'abc',
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
    'acc_no': '124',
    'balance': 1500,
    'password': 'abc',
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


List<String> actions = ['Check balance', 'Cash in', 'Cash out', 'Exit'];

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
    case 2:
      cashIn();
      break;
    case 3:
      cashOut();
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
  String menu = '\nMenu\n-------------\n';
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

  print('\n');
  print('Account details'.toLowerCase());
  print('---------------------');
  print('Account name : ${account['acc_name']}');
  print('Account number : ${account['acc_no']}');
  print('Current balance : ${account['balance']} ks\n');
  print('History');
  print('---------------------');

  final historyStr = (account['history'] as List)
  .map((e)=>'${e['type']} : ${e['amount']}').join('\n');
  print(historyStr);
  print('');

  waitToback();
  runApp();

}

void cashIn(){
  print('\nCashing in'.toUpperCase());
  print('--------------');

  Map<String,dynamic>? account;
  bool retry = false;
  do {
    account = getAccount(retry);
    retry = true;
  } while (account==null);

  int amount = getAmount();
  while (amount <= 0) {
    amount = getAmount(true);
  }

  retry = false;
  bool confirmed = false;
  do {
    confirmed = confirmPassword(account['password'], retry);
    retry = true;
  } while (!confirmed);

  account['balance'] += amount;
  (account['history'] as List).add({'type' : 'cash-in', 'amount': amount});
  print('\n$amount are successfully cashed in!\n');
  waitToback();
  runApp();
}

void cashOut(){
  print('\nCashing out'.toUpperCase());
  print('--------------');

  Map<String,dynamic>? account;
  bool retry = false;
  do {
    account = getAccount(retry);
    retry = true;
  } while (account==null);

  int amount = getAmount();
  while (amount <= 0) {
    amount = getAmount(true);
  }

  retry = false;
  bool confirmed = false;
  do {
    confirmed = confirmPassword(account['password'], retry);
    retry = true;
  } while (!confirmed);

  account['balance'] -= amount;
  (account['history'] as List).add({'type' : 'cash-out', 'amount': amount});
  print('\n$amount are successfully cashed out!\n');
  waitToback();
  runApp();
}


int getAmount([bool retry = false]){
  if(retry) print('Please write a valid amount!');
  stdout.write('Amount: ');
  String? val = stdin.readLineSync();
  return int.tryParse(val??'')?? 0;
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

void waitToback(){
  stdout.write('Press any key to back: ');
  stdin.readLineSync();
}


