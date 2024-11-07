import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityDb {
  List<ActivityEntity>? _activityList;

  List<ActivityEntity> get activityList => _activityList ?? [];

  void addActivityList(ActivityEntity value) {
    _activityList!.add(value);
  }

  void removeActivityList(int index) {
    _activityList!.removeAt(index);
  }
}
