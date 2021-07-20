import 'package:flutter/cupertino.dart';
import 'package:forseason/repository/fake_user_repository.dart';
import 'package:forseason/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this.repository);

 UserRepository repository;

}