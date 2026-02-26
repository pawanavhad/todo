import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final data = await ApiService.fetchTasks();
    setState(() {
      tasks = data;
      loading = false;
    });
  }

  Future<void> deleteTask(String id) async {
    final confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Task"),
        content: const Text("Are you sure?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Delete")),
        ],
      ),
    );

    if (confirm == true) {
      await ApiService.deleteTask(id);
      loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
          ? const Center(
        child: Text(
          "No tasks yet\nTap + to add one",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      )
          : RefreshIndicator(
        onRefresh: loadTasks,
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              task: task,
              onDelete: () => deleteTask(task.id!),
              onEdit: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        EditTaskScreen(task: task),
                  ),
                );
                loadTasks();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add Task"),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          loadTasks();
        },
      ),
    );
  }
}