import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  static Future<Todo> fetchTodoDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/todos/$id'));

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo detail');
    }
  }
}
