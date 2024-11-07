import 'package:primeiro_app/data/activity_list.dart';
import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityUseCase {
  ActivityDb activityList = ActivityDb();

  void addActivity(ActivityEntity activity) {
    activityList.addActivityList(activity);
  }

  void removeActivity(int index) {
    activityList.removeActivityList(index);
  }

  List<ActivityEntity>? getActivities() {
    return activityList.activityList;
  }
}
