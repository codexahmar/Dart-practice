import 'dart:io';

void main() {
  List<String> names = [];
  List<int> ages = [];
  stdout.write("Enter the number of people: ");
  int count = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < count; i++) {
    stdout.write("Enter the name: ");
    String name = stdin.readLineSync()!;
    names.add(name);
    stdout.write("Enter the age: ");
    int age = int.parse(stdin.readLineSync()!);
    ages.add(age);
  }
  for (var i = 0; i < count; i++) {
    print("Name: ${names[i]}, Age: ${ages[i]}");
  }
}
