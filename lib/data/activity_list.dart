import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityDb {
  List<ActivityEntity> activityList = [];

  // List<ActivityEntity> get activityList => _activityList ?? [];

  void addActivityList(ActivityEntity value) {
    activityList.add(value);
    print(activityList);
  }

  void removeActivityList(int index) {
    activityList.removeAt(index);
  }
}
