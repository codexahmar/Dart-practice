import 'dart:io';

void main() {
  List<Map<String, dynamic>> todoList = [];
  loadTasks(todoList);

  while (true) {
    stdout.write(
        "Enter command (add, remove, update, complete, display, save, exit): ");
    String? command = stdin.readLineSync();
    if (command == "add") {
      addTask(todoList);
    } else if (command == "remove") {
      removeTask(todoList);
    } else if (command == "update") {
      updateTask(todoList);
    } else if (command == "complete") {
      completeTask(todoList);
    } else if (command == "display") {
      displayTask(todoList);
    } else if (command == "save") {
      saveTasks(todoList);
    } else if (command == "exit") {
      stdout.write("Are you sure you want to exit? (yes/no): ");
      String? exitConfirmation = stdin.readLineSync();
      if (exitConfirmation != null && exitConfirmation.toLowerCase() == 'yes') {
        saveTasks(todoList);
        break;
      }
    } else {
      print("Invalid Command");
    }
  }
}

void addTask(List<Map<String, dynamic>> todoList) {
  stdout.write("Enter the task name: ");
  String? taskName = stdin.readLineSync();
  stdout.write("Enter the task description: ");
  String? taskDescription = stdin.readLineSync();
  stdout.write("Enter the task priority (1-5): ");
  String? priorityInput = stdin.readLineSync();
  int priority = int.tryParse(priorityInput ?? '3') ?? 3;
  stdout.write("Enter the task due date (yyyy-mm-dd): ");
  String? dueDate = stdin.readLineSync();

  if (taskName != null &&
      taskName.isNotEmpty &&
      taskDescription != null &&
      taskDescription.isNotEmpty) {
    todoList.add({
      "Task": taskName,
      "Description": taskDescription,
      "Priority": priority,
      "DueDate": dueDate,
      "Completed": false
    });
    print('Task Added: $taskName');
  } else {
    print('Invalid input. Task not added.');
  }
}

void removeTask(List<Map<String, dynamic>> todoList) {
  if (todoList.isEmpty) {
    print("Cannot remove because Todo List is empty");
  } else {
    displayTask(todoList);
    stdout.write("Enter the task number you want to remove: ");
    String? taskNumberInput = stdin.readLineSync();
    int? taskNumber = int.tryParse(taskNumberInput ?? '');

    if (taskNumber != null && taskNumber > 0 && taskNumber <= todoList.length) {
      var removedTask = todoList.removeAt(taskNumber - 1);
      print("Task Removed: ${removedTask['Task']}");
    } else {
      print('Invalid task number.');
    }
  }
}

void updateTask(List<Map<String, dynamic>> todoList) {
  if (todoList.isEmpty) {
    print("Cannot update because Todo List is empty");
  } else {
    displayTask(todoList);
    stdout.write("Enter the task number you want to update: ");
    String? taskNumberInput = stdin.readLineSync();
    int? taskNumber = int.tryParse(taskNumberInput ?? '');

    if (taskNumber != null && taskNumber > 0 && taskNumber <= todoList.length) {
      var task = todoList[taskNumber - 1];
      stdout.write("Enter the new task name (leave blank to keep current): ");
      String? newTaskName = stdin.readLineSync();
      stdout.write(
          "Enter the new task description (leave blank to keep current): ");
      String? newTaskDescription = stdin.readLineSync();
      stdout.write(
          "Enter the new task priority (1-5, leave blank to keep current): ");
      String? priorityInput = stdin.readLineSync();
      int? newPriority = int.tryParse(priorityInput ?? '') ?? task['Priority'];
      stdout.write(
          "Enter the new task due date (yyyy-mm-dd, leave blank to keep current): ");
      String? newDueDate = stdin.readLineSync();

      if (newTaskName != null && newTaskName.isNotEmpty) {
        task["Task"] = newTaskName;
      }
      if (newTaskDescription != null && newTaskDescription.isNotEmpty) {
        task["Description"] = newTaskDescription;
      }
      task["Priority"] = newPriority;
      if (newDueDate != null && newDueDate.isNotEmpty) {
        task["DueDate"] = newDueDate;
      }
      print("Task Updated: ${task["Task"]}");
    } else {
      print('Invalid task number.');
    }
  }
}

void completeTask(List<Map<String, dynamic>> todoList) {
  if (todoList.isEmpty) {
    print("Cannot mark as complete because Todo List is empty");
  } else {
    displayTask(todoList);
    stdout.write("Enter the task number you want to mark as complete: ");
    String? taskNumberInput = stdin.readLineSync();
    int? taskNumber = int.tryParse(taskNumberInput ?? '');

    if (taskNumber != null && taskNumber > 0 && taskNumber <= todoList.length) {
      todoList[taskNumber - 1]["Completed"] = true;
      print("Task marked as complete: ${todoList[taskNumber - 1]['Task']}");
    } else {
      print('Invalid task number.');
    }
  }
}

void displayTask(List<Map<String, dynamic>> todoList) {
  if (todoList.isEmpty) {
    print("Cannot display, the list is currently empty");
  } else {
    print('\nCurrent Tasks List:');
    for (var i = 0; i < todoList.length; i++) {
      var task = todoList[i];
      print("Task ${i + 1}:");
      print("  Name: ${task["Task"]}");
      print("  Description: ${task["Description"]}");
      print("  Priority: ${task["Priority"]}");
      print("  Due Date: ${task["DueDate"]}");
      print("  Completed: ${task["Completed"] ? 'Yes' : 'No'}");
      print('--------------------------------------');
    }
  }
}

void saveTasks(List<Map<String, dynamic>> todoList) {
  var file = File('todo_list.txt');
  var sink = file.openWrite();
  for (var task in todoList) {
    sink.write(
        '${task["Task"]},${task["Description"]},${task["Priority"]},${task["DueDate"]},${task["Completed"]}\n');
  }
  sink.close();
  print("Tasks saved to todo_list.txt");
}

void loadTasks(List<Map<String, dynamic>> todoList) {
  var file = File('todo_list.txt');
  if (file.existsSync()) {
    var lines = file.readAsLinesSync();
    for (var line in lines) {
      var parts = line.split(',');
      if (parts.length == 5) {
        todoList.add({
          "Task": parts[0],
          "Description": parts[1],
          "Priority": int.tryParse(parts[2]) ?? 3,
          "DueDate": parts[3],
          "Completed": parts[4].toLowerCase() == 'true'
        });
      }
    }
    print("Tasks loaded from todo_list.txt");
  }
}
