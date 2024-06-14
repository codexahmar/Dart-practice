import 'dart:io';

void main() {
  stdout.write("Enter the count: ");
  int count = int.parse(stdin.readLineSync()!);
  for (var i = 1; i <= count; i++) {
    stdout.write("Enter the number to find even/odd: ");
    int number = int.parse(stdin.readLineSync()!);
    if (number % 2 == 0) {
      print("$number is even");
    } else {
      print("$number is odd");
    }
  }
}
