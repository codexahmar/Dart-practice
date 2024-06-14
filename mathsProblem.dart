import 'dart:io';

void main() {
  // Simple Arithmetic Operation

  print("Enter First Number");
  int numberOne = int.parse(stdin.readLineSync()!);
  print("Enter Second Number");
  int numberTwo = int.parse(stdin.readLineSync()!);
  int sum = numberOne + numberTwo;
  int difference = numberOne - numberTwo;
  int multiplication = numberOne * numberTwo;
  double division = numberOne / numberTwo;

  print(
      "The sum of two numbers is $sum, the difference of two numbers is $difference, the multiplication of two numbers is $multiplication and the division of those two numbers is $division ");

// Convert the Feet into Inches
/*
  stdout.write("Enter the Feet: ");
  var feet = double.parse(stdin.readLineSync()!);
  var inches = feet * 12;
  print("The $feet feet is equal to $inches in inches");
  */

  // Convert Feet to meters
/*
  stdout.write("Enter the Feet: ");
  double feet = double.parse(stdin.readLineSync()!);
  double meters = feet / 3;
  print("The $feet feet is equal to $meters in meters");
  */

  // Convert Celcius into Fahrenheit
/*
  stdout.write("Enter the Temperature in celcius: ");
  double celcius = double.parse(stdin.readLineSync()!);
  double fahrenheit = (celcius * 9 / 5) + 32;
  print("The $celcius celcius is equal to $fahrenheit in fahrenheit");
  */
}
