import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primeiro_app/domain/activity_entity.dart';
import 'package:primeiro_app/presenter/bloc/to_do_evets.dart';
import 'package:primeiro_app/presenter/bloc/to_do_states.dart';
import 'package:primeiro_app/usecase/activity_usecase.dart';

class ToDOBloc extends Bloc<ToDoEvent, ToDoState> {
  late ActivityUseCase useCase;
  ToDOBloc(useCase) : super(InitialToDoState(_getList(useCase))) {
    on<AddActivityEvent>((event, emit) {
      emit(LoadingToDoState());
      useCase.addActivity(event.activity);
      emit(LoadedToDoState(_getList(useCase)));
    });
    on<RemoveActivityEvent>((event, emit) {
      emit(LoadingToDoState());
      useCase.removeActivity(event.index);
      emit(LoadedToDoState(_getList(useCase)));
    });
    on<GetActivitiesEvent>((event, emit) {
      emit(LoadedToDoState(_getList(useCase)));
    });
  }
}

List<ActivityEntity> _getList(ActivityUseCase useCase) {
  return useCase.getActivities() ?? [];
}
