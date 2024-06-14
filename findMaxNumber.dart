import 'dart:io';

void main() {
  findMaxNum();
}

void findMaxNum() {
  stdout.write("Enter the count: ");
  int count = int.parse(stdin.readLineSync()!);
  List<int> numbersList = [];
  for (var i = 0; i < count; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int number = int.parse(stdin.readLineSync()!);
    numbersList.add(number);
  }
  int max = 0;
  max = numbersList[0];
  for (var i = 0; i < numbersList.length; i++) {
    if (max < numbersList[i]) {
      max = numbersList[i];
    }
  }

  print("So the highest number is $max");
}
