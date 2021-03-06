import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/model/result.dart';

abstract class UserRepository {

  void login();

  void logout();

  Stream<Result<LoginUser>> authStateChanges();
}