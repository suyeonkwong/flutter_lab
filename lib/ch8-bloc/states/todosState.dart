import 'package:flutter/material.dart';

//bloc 에 의해 관리 발행할 상태 데이터.. 작성 규칙 없다..
class Todo {
  String title;
  bool completed;
  Todo({required this.title, this.completed = false});

  void toggleCompleted(){
    completed = !completed;
  }
}
class TodosState {
  List<Todo> todos;
  TodosState(this.todos);
}
