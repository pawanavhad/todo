import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController controller;
  bool completed = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.task.title);
    completed = widget.task.completed;
  }

  void updateTask() async {
    widget.task.title = controller.text;
    widget.task.completed = completed;

    await ApiService.updateTask(widget.task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: controller),
            CheckboxListTile(
              title: const Text("Completed"),
              value: completed,
              onChanged: (value) {
                setState(() => completed = value!);
              },
            ),
            ElevatedButton(
              onPressed: updateTask,
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}