import 'package:application/services/api-services.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  Todo? _selectedTodo;

  List<Todo> get todos => _todos;
  Todo? get selectedTodo => _selectedTodo;

  Future<void> fetchTodos() async {
    _todos = await ApiService
        .fetchTodos(); // Panggil metode statis langsung dari kelas
    notifyListeners();
  }

  void selectTodo(Todo todo) {
    _selectedTodo = todo;
    notifyListeners();
  }
}
