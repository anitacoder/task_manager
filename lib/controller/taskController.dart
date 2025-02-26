import 'package:get/get.dart';
import '../Database/database_helper.dart';
import '../Model/Task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() async {
    final dataList = await dbHelper.getTasks();
    tasks.assignAll(dataList);
  }

  void addTask(String title, String description) async {
    final task = Task(
      title: title,
      description: description,
      creationTime: DateTime.now(),
      isCompleted: 0, // Assuming 0 for incomplete tasks
    );
    final id = await dbHelper.insertTask(task);
    task.id = id;
    tasks.add(task);
  }

  void updateTask(int id, String title, String description) async {
    final task = tasks.firstWhere((element) => element.id == id);
    task.title = title;
    task.description = description;
    await dbHelper.updateTask(task);
    tasks.refresh();
  }

  void deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    tasks.removeWhere((task) => task.id == id);
  }
}
