class Animal {
  void sound() {
    print("Animal makes a sound.");
  }
}

class Dog extends Animal {

  void sound(){
    print("Dog is barking...!");
  }
}

class Cat extends Animal {
  @override
  void sound(){
    print('Meows Meows');
  }
}


void main() {
  final animal = Cat();
  animal.sound();
  doIt(animal);

}


void doIt(Animal animal){
  animal.sound();
}




