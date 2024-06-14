import 'dart:io';

void main() {
  stdout.write("Enter consumed unit: ");
  int consumedUnit = int.parse(stdin.readLineSync()!);
  int finalPrice = 0;
  if (consumedUnit < 100) {
    finalPrice = consumedUnit * 20;
    print("Your electricity bill is $finalPrice");
    print("consumed unit is $consumedUnit");
    print("per unit cost is 20");
  } else if (consumedUnit > 100 && consumedUnit < 200) {
    finalPrice = consumedUnit * 30;
    print("Your electricity bill is $finalPrice");
    print("consumed unit is $consumedUnit");
    print("per unit cost is 30");
  } else if (consumedUnit > 200 && consumedUnit < 300) {
    finalPrice = consumedUnit * 40;
    print("Your electricity bill is $finalPrice");
    print("consumed unit is $consumedUnit");
    print("per unit cost is 30");
  } else {
    finalPrice = consumedUnit * 50;
    print("Your electricity bill is $finalPrice");
    print("consumed unit is $consumedUnit");
    print("per unit cost is 40");
  }
}
