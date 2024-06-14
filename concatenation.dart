import 'dart:io';

void main() {
  print('Enter first name:');
  String? firstName = stdin.readLineSync();
  print('Enter last name:');
  String? lastName = stdin.readLineSync();

  String fullName = (firstName ?? '') + '' + (lastName ?? '');
  print("My fullname is $fullName");
}
