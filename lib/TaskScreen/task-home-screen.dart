import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task.dart';
import '../controller/taskController.dart';

class TaskScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  taskController.deleteTask(task.id!);
                },
              ),
              onTap: () {
                Get.to(() => TaskForm(task: task));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TaskForm());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
