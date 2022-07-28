import 'dart:math';

final random = Random();

void main() async {
  SpaceShip spType(health, firePower){
      if (random.nextBool() == true){
      return ArmoredSpaceShip(health, firePower);
      } else {return HighSpeedSpaceShip(health, firePower);}
    }

    SpaceShip sp1 = spType(random.nextInt(1000) + 100, random.nextInt(300) + 100);
    SpaceShip sp2 = spType(random.nextInt(1000) + 100, random.nextInt(300) + 100);

    do{
    BattleField().startBattle(sp1, sp2);
    } while(sp1.health != 0 || sp2.health != 0);
}

abstract class SpaceShip {
  int health, firePower;

  SpaceShip(this.health, this.firePower);

  // Methods
  // hit
  // isDestroyed

}

class ArmoredSpaceShip extends SpaceShip{
  ArmoredSpaceShip(super.health, super.firePower);

  //randomly absorbs hit
  int maxArmorPower = random.nextInt(41);

  int blockDodge(health, firePower){
    return health - (firePower - maxArmorPower);
  }
}

class HighSpeedSpaceShip extends SpaceShip{
  HighSpeedSpaceShip(super.health, super.firePower);
  //Whether dodges hit or not

  String blockDodge(bool dodging, int firePower, int health){
    if (dodging == true){
      return "successfully dodged, current health: $health";
    } else{
      return "unsuccessful dodge, damage: $firePower, previous health: $health, current health: ${health - firePower}";
    }
  }
}

class BattleField{
  void startBattle(SpaceShip sp1, SpaceShip sp2){
    // randomly a space ship is selected to hit first
    // SpaceShips hit each other
    // until one of the destroyed
    String sp1stats = sp1.toString();
    print(sp1stats);
    String sp2stats = sp2.toString();
    print(sp2stats);

    do{
      if (sp1stats == "Instance of 'ArmoredSpaceShip'"){
        sp1.health = ArmoredSpaceShip(sp1.health, sp1.firePower).blockDodge(sp1.health, sp2.firePower);
        print("Shot. Current SP1 health: ${sp1.health}");
      } else{
        print(HighSpeedSpaceShip(sp1.health, sp1.firePower).blockDodge(random.nextBool(),sp2.firePower, sp1.health));
      }
      if (sp2stats == "Instance of 'ArmoredSpaceShip'"){
        sp2.health = ArmoredSpaceShip(sp2.health, sp2.firePower).blockDodge(sp2.health, sp1.firePower);
        print("Shot. Current SP1 health: ${sp2.health}");
      } else{
        print(HighSpeedSpaceShip(sp2.health, sp2.firePower).blockDodge(random.nextBool(), sp1.firePower, sp2. health));
      }

    } while(sp1.health != 0 || sp2.health != 0);
  }
}