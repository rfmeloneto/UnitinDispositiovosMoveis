import 'package:primeiro_app/domain/activity_entity.dart';

abstract class DataBase {
  List<ActivityEntity> activityList = [];
  void addActivityList(ActivityEntity value) {}
  void removeActivityList(int index) {}
  bool isDone(int index) {
    throw UnimplementedError("isDone não está implementado");
  }
}
