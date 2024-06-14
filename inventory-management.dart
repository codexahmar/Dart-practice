import 'dart:io';

void main() {
  List<Map<String, dynamic>> inventory = [];
  while (true) {
    stdout.write("Enter the command (add,remove,update,display,exit): ");
    String? command = stdin.readLineSync();
    if (command == "add") {
      addItems(inventory);
    } else if (command == "remove") {
      removeItems(inventory);
    } else if (command == "update") {
      updateItems(inventory);
    } else if (command == "display") {
      displayItems(inventory);
    } else if (command == "exit") {
      break;
    } else {
      print("Invalid Command!");
    }
  }
}

void addItems(List<Map<String, dynamic>> inventory) {
  stdout.write("Enter the name of the item: ");
  String itemName = stdin.readLineSync()!;

  stdout.write("Enter the quantity of the item: ");
  int itemQuantity = int.parse(stdin.readLineSync()!);

  stdout.write("Enter the price of the item: ");
  double itemPrice = double.parse(stdin.readLineSync()!);
  inventory
      .add({"name": itemName, "quantity": itemQuantity, "price": itemPrice});
  print(
      'Items Added: Name: $itemName, Quantity: $itemQuantity, Price: $itemPrice');
}

void removeItems(List<Map<String, dynamic>> inventory) {
  if (inventory.isEmpty) {
    print('No items in inventory to be removed.');
  } else if (inventory.isNotEmpty) {
    stdout.write("Enter the name of the item to remove: ");
    String? itemName = stdin.readLineSync();
    if (itemName != null) {
      bool itemFound = false;
      for (int i = 0; i < inventory.length; i++) {
        if (inventory[i]['name'] == itemName) {
          inventory.removeAt(i);
          itemFound = true;
          print('Item removed: $itemName');
          break;
        }
      }
      if (!itemFound) {
        print('Item not found: $itemName');
      }
    }
  } else {
    print('Invalid input.');
  }
}

void updateItems(List<Map<String, dynamic>> inventory) {
  if (inventory.isEmpty) {
    print('No items in inventory to be updated.');
  } else if (inventory.isNotEmpty) {
    stdout.write("Enter the name of the item to update: ");
    String? itemName = stdin.readLineSync();

    stdout.write("Enter the new quantity to update: ");
    int newQuantity = int.parse(stdin.readLineSync()!);

    stdout.write("Enter the new price to update: ");
    double newPrice = double.parse(stdin.readLineSync()!);
    if (itemName != null && newQuantity >= 0) {
      bool itemFound = false;
      for (int i = 0; i < inventory.length; i++) {
        if (inventory[i]['name'] == itemName) {
          inventory[i]['quantity'] = newQuantity;
          inventory[i]['price'] = newPrice;
          itemFound = true;
          print(
              'Item updated: Name: $itemName, New Quantity: $newQuantity, New Price: $newPrice');
          break;
        }
      }
      if (!itemFound) {
        print('Item not found: $itemName');
      }
    }
  } else {
    print('Invalid input.');
  }
}

void displayItems(List<Map<String, dynamic>> inventory) {
  if (inventory.isEmpty) {
    print('No items in inventory.');
  } else {
    print('\nCurrent Inventory:');
    for (var i = 0; i < inventory.length; i++) {
      print(
          "Name:${inventory[i]["name"]}, Quantity:${inventory[i]["quantity"]}, Price:${inventory[i]["price"]}");
    }
    print('--------------------------------------');
  }
}
