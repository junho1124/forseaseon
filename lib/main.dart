import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:forseason/view_model/login_view_model.dart';
import 'package:forseason/repository/fake_document_input_repository.dart';
import 'package:forseason/repository/fake_document_repository.dart';
import 'package:forseason/repository/fake_user_repository.dart';
import 'package:forseason/view/main_page/main_page.dart';
import 'package:forseason/view_model/document_input_view_model.dart';
import 'package:forseason/view_model/provider.dart';
import 'package:forseason/view_model/document_view_model.dart';
import 'package:forseason/view_model/user_view_medel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


void main() {
  final docRepository = FakeDocumentRepository();
  final userRepository = FakeUserRepository();
  final inputRepository = FakeDocumentInputRepository();
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider.value(value: MyProvider()),
    ChangeNotifierProvider.value(value: LoginViewModel()),
    ChangeNotifierProvider.value(value: DocumentViewModel(docRepository)),
    ChangeNotifierProvider.value(value: UserViewModel(userRepository)),
    ChangeNotifierProvider.value(value: DocumentInputViewModel(inputRepository)),
  ],
    child: MyApp(),),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    super.initState();
    final login = context.read<LoginViewModel>();
    context.read<DocumentInputViewModel>().fetch();
    context.read<DocumentViewModel>().fetch();
    login.googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        login.user = account;
      });
    });
    login.googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'for : season',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFFF4DCDB)),
        focusColor: Color(0xFFF3C0C0),
        selectedRowColor: Color(0xFFF3C0C0),
      ),
      home: context.watch<LoginViewModel>().user == null ? Scaffold(
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
                    context.read<LoginViewModel>().handleSignIn();
                  },
                ),
              ],
            )
        )
    ) : MainPage()
    );
  }
}
