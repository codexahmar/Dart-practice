import 'dart:io';

void main() {
  // Variable swapping with temp variable
  /*
  int a = 20, b = 10, temp;
  print("Values before swapping");
  print("The value of A is: $a");
  print("The value of B is: $b");
  print("Values after swapping");
  temp = a;
  a = b;
  b = temp;
  print("The value of A is: $a");
  print("The value of B is: $b");
  */

  // Variable swapping of three numbers with temp variable
  /*
  int x = 3, y = 4, z = 5, temp, temp2;
  print("Values before swapping $x,$y,$z");
  temp = x; // 3
  temp2 = y; // 4
  y = z; // 5
  x = temp2; // 4
  z = temp; // 3

  print("Values after swapping $x,$y,$z");
  */

  // Variable swapping of two variables without using temp variable
/*
  stdout.write("Enter First Number: ");
  int firstNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Second Number: ");
  int secondNumber = int.parse(stdin.readLineSync()!);

  print("Numbers before swapping: $firstNumber,$secondNumber");
  firstNumber = firstNumber + secondNumber;
  secondNumber = firstNumber - secondNumber;
  firstNumber = firstNumber - secondNumber;

  print("Numbers after swapping: $firstNumber,$secondNumber");
*/

  // Variable swapping of three variables without using temp variable

  stdout.write("Enter First Number: ");
  int firstNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Second Number: ");
  int secondNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Third Number: ");
  int thirdNumber = int.parse(stdin.readLineSync()!);

  print("Numbers before swapping: $firstNumber,$secondNumber,$thirdNumber");
  firstNumber = firstNumber + secondNumber;
  secondNumber = firstNumber - secondNumber;
  firstNumber = firstNumber - secondNumber;

  secondNumber = secondNumber + thirdNumber;
  thirdNumber = secondNumber - thirdNumber;
  secondNumber = secondNumber - thirdNumber;
  print("Numbers after swapping: $firstNumber,$secondNumber,$thirdNumber");
}
