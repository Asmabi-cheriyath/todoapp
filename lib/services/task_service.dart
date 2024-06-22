import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/task_model.dart';

class TaskService {
  final CollectionReference _taskcollection =
      FirebaseFirestore.instance.collection("tasks");

  //create
  Future<TaskModel?> createTask(TaskModel task) async {
    print(task.body);

    try {
      final taskMap = task.toMap();
      print(taskMap);

      await _taskcollection.doc(task.id).set(taskMap);

      return task;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
