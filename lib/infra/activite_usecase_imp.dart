import 'package:primeiro_app/data/activity_list.dart';
import 'package:primeiro_app/infra/activity_list_imp.dart';
import 'package:primeiro_app/domain/activity_entity.dart';
import 'package:primeiro_app/domain/activity_usecase.dart';

class ActivityUseCaseImp extends ActivityUseCase {
  DataBase activityList = ActivityDb();

  @override
  void addActivity(ActivityEntity activity) {
    activityList.addActivityList(activity);
  }

  @override
  void removeActivity(int index) {
    activityList.removeActivityList(index);
  }

  @override
  List<ActivityEntity>? getActivities() {
    return activityList.activityList;
  }

  @override
  bool isDone(int index) {
    return activityList.isDone(index);
  }
}
