import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityDb {
  List<ActivityEntity> activityList = [];

  void addActivityList(ActivityEntity value) {
    activityList.add(value);
  }

  void removeActivityList(int index) {
    activityList.removeAt(index);
  }
}
