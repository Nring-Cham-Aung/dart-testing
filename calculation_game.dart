import 'dart:io';
import 'dart:math';

void main(){
  print('\n\n');
  print('************************');
  print('Welcome from calculation game!');
  print('************************');
  print('\nWrite "Exit" to stop the game.');
  start();
}

var all = 0;
var corrected = 0;

void start(){
  var random = Random.secure();

  int n1 = random.nextInt(200);
  int n2 = random.nextInt(200);
  bool isPlus = random.nextBool();
  String optStr = isPlus? '+' : '-';
  int calculated = isPlus
  ? plus(n1, n2) 
  : minus(n1, n2);

  print('\nPlease solve below the equation.');
  print('----------------------------');
  stdout.write('$n1 $optStr $n2 = ');
  String? result = stdin.readLineSync();
  print('----------------------------');

  if(result == 'Exit'){
    print('\nResult \nAll quiz ($all)\nCorrected ($corrected)\nWrong (${all-corrected})');
    print('\n*********************');
    print('Bye..., See you again!');
    return;
  }

  int? resultInt = int.tryParse(result??'');

  bool isCorrect = resultInt == calculated;
  String message = isCorrect
  ? 'Wow! you got it.'
  : 'Oops!\nSorry! try again!';

  all++;
  if(isCorrect) corrected++;

  print(message);
  start();
}

int plus(n1, n2)=> n1 + n2;
int minus(n1, n2)=> n1 - n2;