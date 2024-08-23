import 'package:bloc/bloc.dart';
import '../events/events.dart';
import '../states/todosState.dart';

//제네릭 타입 - 이벤트 , 상태
class TodosBloc extends Bloc<TodosEvent, TodosState>{
  TodosBloc(): super(TodosState([])){//상위 생성자 매개변수, 상태 초기값..
    //이벤트 등록..
    //emit - 상태 발행..
    
    /// 이벤트 발생에 의한 상태 발행
    /// 상태는 변경되는 것이 아니라 새로 만들어지는 것이다
    on<AddTodoEvent>((event, emit){
      //state 는 이전 상태를 가지는 property
      List<Todo> newTodos = List.from(state.todos)
          ..add(event.todo);
      emit(TodosState(newTodos));
    });
    on<DeleteTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos)
        ..remove(event.todo);
      emit(TodosState(newTodos));
    });
    on<ToggleCompletedTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos);
      int index = newTodos.indexOf(event.todo);
      newTodos[index].toggleCompleted();
      emit(TodosState(newTodos));
    });
  }
  @override
  void onTransition(Transition<TodosEvent, TodosState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}