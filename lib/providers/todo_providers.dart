import 'package:application/services/api-services.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  Todo? _selectedTodo;

  List<Todo> get todos => _todos;
  Todo? get selectedTodo => _selectedTodo;

  Future<void> fetchTodos(String apiUrl) async {
    _todos =
        await ApiService.fetchTodos(apiUrl); // Berikan apiUrl sebagai argumen
    notifyListeners();
  }

  void selectTodo(Todo todo) {
    _selectedTodo = todo;
    notifyListeners();
  }
}
