import 'dart:io';

void main() {
  stdout.write("Enter the number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number > 0) {
    print("So $number is positive");
    for (int i = 1; i <= 10; i++) {
      int result = number * i;
      print("$number * $i = $result");
    }
  } else {
    print("So $number is negative");
  }
}
