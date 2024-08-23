import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8_todo_provider/providers/todos_model.dart';

import 'package:provider/provider.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
      create: (context) => TodosModel(),
      child: MaterialApp(
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.blue, secondary: Colors.red),
        ),
      ),
    );
  }
}
