import 'package:primeiro_app/data/reposotory.dart';
import 'package:primeiro_app/data/service_connection.dart';
import 'package:primeiro_app/presenter/post_notifyer.dart';

class StorePost {
  final PostNotifyer postNotifyer = PostNotifyer(PostRepository(ServiceConnection()));
}