import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();

  void saveTask() async {
    if (controller.text.trim().isEmpty) return;

    await ApiService.addTask(
      Task(title: controller.text, completed: false),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Task title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveTask,
                child: const Text("Save Task"),
              ),
            )
          ],
        ),
      ),
    );
  }
}