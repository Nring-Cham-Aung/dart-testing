class Animal {
  String name;
  Animal(this.name);
  void eat() {
    print("$name is eating.");
  }
}


class Dog extends Animal {
  String breed;
  // Dog(String name, this.breed) : super(name);
  Dog(super.name, this.breed);

  void bark() {
    print("$name is barking.");
  }
}


void main(){
  final animal = Animal('Jokey');
  final dog = Dog('Golden Retriver', 'Ranbo');
  animal.eat();
  dog.bark();
  doIt(dog);
}

void doIt(Animal animal){
  animal.eat();
}
