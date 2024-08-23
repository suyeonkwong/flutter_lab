import '../states/todosState.dart';

//bloc 에 발생시킬 이벤트..

abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  Todo todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodosEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}
class ToggleCompletedTodoEvent extends TodosEvent {
  Todo todo;
  ToggleCompletedTodoEvent(this.todo);
}
