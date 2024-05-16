import 'package:application/services/api-services.dart';
import 'package:flutter/material.dart';
import 'package:application/screens/todo_detail_screen.dart';

import '../models/todo.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Todo>> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = ApiService.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No todos found'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Completed: ${snapshot.data![index].completed ? 'Yes' : 'No'}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: snapshot.data![index].completed
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TodoDetailScreen(todo: snapshot.data![index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
