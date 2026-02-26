import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(Constants.baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }

  static Future<void> addTask(Task task) async {
    await http.post(
      Uri.parse(Constants.baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(task.toJson()),
    );
  }

  static Future<void> updateTask(Task task) async {
    await http.put(
      Uri.parse("${Constants.baseUrl}/${task.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(task.toJson()),
    );
  }

  static Future<void> deleteTask(String id) async {
    await http.delete(Uri.parse("${Constants.baseUrl}/$id"));
  }
}