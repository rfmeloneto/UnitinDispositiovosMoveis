import 'package:primeiro_app/domain/activity_entity.dart';

abstract class ActivityUseCase {
  void addActivity(ActivityEntity activity);
  void removeActivity(int index);
  bool isDone(int index);
  List<ActivityEntity>? getActivities();
}
