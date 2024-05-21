import 'package:flutter/material.dart';
import 'package:application/screens/todo_list_screen.dart';

// Mengimpor file konfigurasi
import 'config/config_dev.dart' as dev;
import 'config/config_test.dart' as test;
import 'config/config_prod.dart' as prod;

void main() {
  const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  late String apiUrl;

  // Memuat konfigurasi sesuai dengan lingkungan
  if (environment == 'prod') {
    apiUrl = prod.Config.apiUrl;
  } else if (environment == 'test') {
    apiUrl = test.Config.apiUrl;
  } else {
    apiUrl = dev.Config.apiUrl;
  }

  runApp(MyApp(apiUrl: apiUrl));
}

class MyApp extends StatelessWidget {
  final String apiUrl;

  const MyApp({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan "Debug"
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(apiUrl: apiUrl),
    );
  }
}
