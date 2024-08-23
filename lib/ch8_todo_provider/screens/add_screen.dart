import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8_todo_provider/models/todo.dart';
import 'package:flutter_lab/ch8_todo_provider/providers/todos_model.dart';

import 'package:provider/provider.dart';



class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final controller = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onAdd() {
    /// 유저 입력 데이터 획득..
    final String title = controller.text;
    final bool completed = completedStatus;
    if(title.isNotEmpty) {
      final Todo todo = Todo(title: title, completed: completed);
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      /// 이전 화면으롲 화면 전환..
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: controller),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                          completedStatus = checked ?? false;
                        }),
                    title: Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
