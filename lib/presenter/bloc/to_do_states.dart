import 'package:primeiro_app/domain/activity_entity.dart';

abstract class ToDoState {}

class InitialToDoState extends ToDoState {
  final List<ActivityEntity> activities;
  final String message = "Sem Atividades Cadastradas";
  InitialToDoState(this.activities);
}

class LoadingToDoState extends ToDoState {}

class LoadedToDoState extends ToDoState {
  final List<ActivityEntity> activities;
  LoadedToDoState(this.activities);
}

class ErrorToDoState extends ToDoState {
  final String message = "Erro ao carregar as Atividades";
  ErrorToDoState();
}
