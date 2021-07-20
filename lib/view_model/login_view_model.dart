import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/model/result.dart';
import 'package:forseason/repository/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  UserRepository repository;

  LoginUser? user;

  LoginViewModel(this.repository) {
    repository.authStateChanges().listen((Result<LoginUser> result) {
      if (result is Success<LoginUser>) {
        user = result.data;
      } else if (result is Error<LoginUser>) {
        user = null;
        print(result.e);
      }
      notifyListeners();
    });

  }

  void login() {
    repository.login();
  }

  void logout() {
    repository.logout();
  }

}
