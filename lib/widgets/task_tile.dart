import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(
          task.completed
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: task.completed ? Colors.green : Colors.grey,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            decoration:
            task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}