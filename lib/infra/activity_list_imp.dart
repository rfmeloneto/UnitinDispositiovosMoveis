import 'package:primeiro_app/data/activity_list.dart';
import 'package:primeiro_app/data/db.dart';
import 'package:primeiro_app/domain/activity_entity.dart';

class ActivityDb implements DataBase {
  DB db = DB.instance;
  @override
  late List<ActivityEntity> activityList = db.activityList;

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
