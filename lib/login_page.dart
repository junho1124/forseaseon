import 'package:flutter/material.dart';
import 'package:forseason/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('SIGN IN'),
                  onPressed: () {
                    context.read<LoginViewModel>().login();
                  },
                ),
              ],
            )
        )
    );
  }
}