import 'dart:async';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/model/result.dart';
import 'package:forseason/repository/user_repository.dart';

class FakeUserRepository extends UserRepository {
  StreamController<LoginUser?> _streamController = StreamController();
  LoginUser? user = LoginUser(
        '최준호',
        'wnsghqwe@naver.com',
        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg'
  );


  @override
  void login() {
    _streamController.add(user);
  }

  @override
  void logout() {
    _streamController.add(null);
  }

  @override
  Stream<Result<LoginUser>> authStateChanges() {
    return _streamController.stream.map((LoginUser? user) {
      if (user != null) {
        return Result.success(user);
      }
      return Result.error(Exception('로그인 오류'));
    });
  }

}