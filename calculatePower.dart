import 'dart:io';

void main() {
  stdout.write("Enter the number: ");
  int number = int.parse(stdin.readLineSync()!);
  for (var i = 1; i < 10; i++) {
    int result = 1;
    for (var j = 0; j < i; j++) {
      result = result * number;
    }
    print("$number to the power of $i is $result");
  }
}
