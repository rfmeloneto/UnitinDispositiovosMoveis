import 'package:primeiro_app/domain/activity_entity.dart';

class DB {
  static DB? _instance;
  List<ActivityEntity> activityList = [];

  DB._(); 

  static DB get instance {
    if (_instance == null) {
      _instance = DB._();
    }
    return _instance!;
  }
}