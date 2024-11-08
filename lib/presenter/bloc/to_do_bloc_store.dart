import 'package:primeiro_app/presenter/bloc/to_do_bloc.dart';
import 'package:primeiro_app/usecase/activite_usecase_imp.dart';

class ActivityStore extends ToDOBloc {
  final ActivityUseCaseImp activityUseCase;
  ActivityStore(this.activityUseCase) : super(activityUseCase);
}
