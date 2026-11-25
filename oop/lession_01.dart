
class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

void main(){

  final p1 = Person("Aung la", 40);
  final p2 = Person("Joker", 24);

  sayInfo(p1);
  sayInfo(p2);

  // final p3 = {'name':'Aung la', 'age':40};
  // final p4 = {'name':'Joker', 'aeg':20};

  // sayInfo2(p3);
  // sayInfo2(p4);

}

void sayInfo(Person person){
  print("I'm ${person.name} and ${person.age} years old.");
}

// void sayInfo2(Map<String,dynamic> person){
//   print("I'm ${person['name']} and ${person['age']} years old.");
// }