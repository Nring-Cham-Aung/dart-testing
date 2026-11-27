

class Skin {
  String color;
  String skinName;
  Skin(this.color, this.skinName);

  void showPreview(){
    print('Skin name: $skinName');
    print('Color: $color');
  }
}


class Charactor extends Skin {
  String name;
  int attackSpeed = 50;
  Charactor(this.name, String color, String skinName,{this.attackSpeed = 50}) : super (color, skinName);

  Charactor.withSkin(String name, Skin skin) : this(name, skin.color, skin.skinName, attackSpeed: 58);
  
  Charactor.without(String name) : this(name, 'no color', 'default');

  void defend(){
    print('$name is defending');
  }

  void attack(){
    print('$name is attacking');
  }

  @override
  void showPreview() {
    print(name);
    super.showPreview();
  }
}


class Natalia extends Charactor {
  Natalia() : super.without('Natalia');
  Natalia.withSkin(Skin skin) : super.withSkin('Natalia', skin);

  @override
  void defend() {
    print('${this.name} is making smooth area!');
  }

  @override
  void attack() {
    print('${this.name} is bruching with her nails');
  }

}

class Layla extends Charactor {
  Layla() : super.without('Layla');
  Layla.withSkin(Skin skin) : super.withSkin('Layla', skin);

  @override
  void defend() {
    print('${this.name} is running');
  }

  @override
  void attack() {
    print('${this.name} is shooting with her gun!');
  }

}




void main(){
  final List<Charactor> matchCharactor = [Layla(), Natalia.withSkin(Skin('Gold', 'legend'))];

  for (var c in matchCharactor) {
    c.showPreview();
    print('Attack speed : ${c.attackSpeed}');
    print('-------------');
  }
}

