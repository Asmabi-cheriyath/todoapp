import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/services/task_service.dart';
import 'package:uuid/uuid.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _discriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _discriptionController.dispose();
    super.dispose();
  }

  final _taskKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _taskKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: themedata.textTheme.displayMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 2,
                color: Colors.teal,
                endIndent: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: themedata.textTheme.displaySmall,
                controller: _titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title is Mandatory";
                  }
                },
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                    hintText: "Enter Task Title",
                    hintStyle: themedata.textTheme.displaySmall,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: themedata.textTheme.displaySmall,
                controller: _discriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Write the Discription";
                  }
                },
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                    hintText: "Write the Discription",
                    hintStyle: themedata.textTheme.displaySmall,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_taskKey.currentState!.validate()) {
                      _addTask();
                    }
                  },
                  child: Container(
                    height: 48,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add Task",
                        style: themedata.textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addTask() async {
    var id = const Uuid().v1();
    TaskModel _taskModel = TaskModel(
        title: _titleController.text,
        body: _discriptionController.text,
        id: id,
        status: 1,
        createdAt: DateTime.now());

    TaskService _taskService = TaskService();
    final task = await _taskService.createTask(_taskModel);

    if (task != null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Task Created")));
    }
  }
}
