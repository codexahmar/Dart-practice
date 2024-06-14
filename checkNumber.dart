import 'dart:io';

void main() {
  // Program that checks if the name contains numbers

  stdout.write('Type your Name: ');
  String? name = stdin.readLineSync();
  bool hasNumbers = false;

  if (name != null) {
    for (int i = 0; i < name.length; i++) {
      if (name[i].contains(RegExp(r'[0-9]'))) {
        hasNumbers = true;
        break;
      }
    }
    print('Your name is: $name. Does it contain numbers? $hasNumbers');
  } else {
    print('Unexpected Error');
  }
}
