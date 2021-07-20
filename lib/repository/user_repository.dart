import 'package:forseason/model/login_user_model.dart';

abstract class UserRepository {

  LoginUser? user;

  void login();

  void logout();

  // Stream<LoginUser> authStateChanges();
}