import 'package:primeiro_app/data/activity_list.dart';
import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityDb implements DataBase {
  @override
  List<ActivityEntity> activityList = [];

  @override
  void addActivityList(ActivityEntity value) {
    activityList.add(value);
  }

  @override
  void removeActivityList(int index) {
    activityList.removeAt(index);
  }

  @override
  bool isDone(int index) {
    activityList[index].isDone = !activityList[index].isDone;
    return activityList[index].isDone;
  }
}
