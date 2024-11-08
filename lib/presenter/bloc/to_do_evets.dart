import 'package:primeiro_app/domain/activity_entity.dart';

abstract class ToDoEvent {}

class AddActivityEvent extends ToDoEvent {
    final ActivityEntity activity;
    AddActivityEvent({required this.activity});
}
class RemoveActivityEvent extends ToDoEvent {
    final int index;
    RemoveActivityEvent({required this.index});
}