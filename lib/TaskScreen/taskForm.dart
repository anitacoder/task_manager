import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/Task.dart';
import '../controller/taskController.dart';

class TaskForm extends StatelessWidget {
  final TaskController taskController = Get.find();
  final Task? task;

  TaskForm({this.task});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (task == null) {
                  taskController.addTask(
                    titleController.text,
                    descriptionController.text,
                  );
                } else {
                  taskController.updateTask(
                    task!.id!,
                    titleController.text,
                    descriptionController.text,
                  );
                }
                Get.back();
              },
              child: Text(task == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
