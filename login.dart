import 'dart:io';

void main() {
  List<Map<String, dynamic>> database = [];
  while (true) {
    stdout.write(
        "Enter command (signup, login, delete, update, display, exit): ");
    String? command = stdin.readLineSync();
    if (command == "signup") {
      signUp(database);
    } else if (command == "login") {
      login(database);
    } else if (command == "delete") {
      deleteUser(database);
    } else if (command == "update") {
      updateUser(database);
    } else if (command == "display") {
      displayUser(database);
    } else if (command == "exit") {
      break;
    } else {
      print("Invalid Command!");
    }
  }
}

void signUp(List<Map<String, dynamic>> database) {
  stdout.write("Enter your name to create account: ");
  String? userName = stdin.readLineSync();

  if (userName == null || userName.isEmpty) {
    print("Invalid input. Name cannot be empty.");
    return;
  }

  stdout.write("Enter your email to create account: ");
  String? userEmail = stdin.readLineSync();

  if (userEmail == null || userEmail.isEmpty) {
    print("Invalid input. Email cannot be empty.");
    return;
  }

  stdout.write("Enter your password to create account: ");
  String? userPassword = stdin.readLineSync();

  if (userPassword == null || userPassword.isEmpty) {
    print("Invalid input. Password cannot be empty.");
    return;
  }

  stdout.write("Confirm your password to create account: ");
  String? confirmPassword = stdin.readLineSync();

  if (confirmPassword == null || confirmPassword.isEmpty) {
    print("Invalid input. Confirm password cannot be empty.");
    return;
  }

  if (userPassword != confirmPassword) {
    print("Passwords do not match.");
    return;
  }

  database.add({
    "Name": userName,
    "Email": userEmail,
    "Password": userPassword,
    "ConfirmPassword": confirmPassword,
  });

  print(
      'Account Created: Name: $userName, Email: $userEmail, Password: $userPassword, ConfirmPassword: $confirmPassword');
}

void login(List<Map<String, dynamic>> database) {
  if (database.isEmpty) {
    print("Database is currently empty");
  } else {
    stdout.write("Enter your email to login: ");
    String? userEmail = stdin.readLineSync();

    stdout.write("Enter your password to login: ");
    String? userPassword = stdin.readLineSync();

    bool loginSuccess = false;
    for (var i = 0; i < database.length; i++) {
      if (database[i]["Email"] == userEmail &&
          database[i]["Password"] == userPassword) {
        loginSuccess = true;
        break;
      }
    }
    if (loginSuccess) {
      print('Login successful!');
    } else {
      print('Invalid email or password.');
    }
  }
}

void deleteUser(List<Map<String, dynamic>> database) {
  if (database.isEmpty) {
    print("Database is currently empty");
  } else {
    stdout.write("Enter the name of the user to remove: ");
    String? userName = stdin.readLineSync();
    bool userFound = false;
    for (var i = 0; i < database.length; i++) {
      if (database[i]["Name"] == userName) {
        database.removeAt(i);
        userFound = true;
        print('User deleted: $userName');
        break;
      }
    }
    if (!userFound) {
      print('User not found: $userName');
    }
  }
}

void updateUser(List<Map<String, dynamic>> database) {
  if (database.isEmpty) {
    print("Database is currently empty");
    return;
  }

  stdout.write("Enter the name to update account: ");
  String? userName = stdin.readLineSync();

  if (userName == null || userName.isEmpty) {
    print("Invalid input. Username cannot be empty.");
    return;
  }

  stdout.write("Enter the new password to update account: ");
  String? userPassword = stdin.readLineSync();

  if (userPassword == null || userPassword.isEmpty) {
    print("Invalid input. Password cannot be empty.");
    return;
  }

  stdout.write("Confirm the new password to update account: ");
  String? confirmPassword = stdin.readLineSync();

  if (confirmPassword == null || confirmPassword.isEmpty) {
    print("Invalid input. Confirm password cannot be empty.");
    return;
  }

  if (userPassword != confirmPassword) {
    print("Passwords do not match.");
    return;
  }

  bool userFound = false;
  for (var i = 0; i < database.length; i++) {
    if (database[i]['Name'] == userName) {
      database[i]['Password'] = userPassword;
      database[i]['ConfirmPassword'] = confirmPassword;
      userFound = true;
      break;
    }
  }

  if (!userFound) {
    print('User not found: $userName');
  } else {
    print("User details updated successfully.");
  }
}

void displayUser(List<Map<String, dynamic>> database) {
  if (database.isEmpty) {
    print("Database is currently empty");
  } else {
    print('\nCurrent Inventory:');
    for (var i = 0; i < database.length; i++) {
      print(
          "Name: ${database[i]["Name"]}, Email: ${database[i]["Email"]}, Password: ${database[i]["Password"]}");
    }
    print('--------------------------------------');
  }
}
