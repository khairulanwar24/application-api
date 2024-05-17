import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:application/main.dart';

void main() {
  testWidgets('Todo list smoke test', (WidgetTester tester) async {
    // Set API URL for testing
    const String testApiUrl = 'https://jsonplaceholder.typicode.com/todos';

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(apiUrl: testApiUrl));

    // Verify that the app displays the todo list screen.
    expect(find.text('Todo List'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Assuming the API call and UI updates accordingly,
    // you should add more test cases to verify the expected behaviors,
    // like displaying a list of todos.
  });
}
