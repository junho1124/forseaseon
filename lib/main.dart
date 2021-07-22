import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:forseason/provider_page.dart';
import 'package:forseason/repository/firebase_repository/firebase_user_repository.dart';
import 'package:forseason/view_model/login_view_model.dart';
import 'package:forseason/repository/fake_repository/fake_document_repository.dart';
import 'package:forseason/view/main_page/main_page.dart';
import 'package:forseason/view_model/provider.dart';
import 'package:forseason/view_model/document_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  final fakeDocRepository = FakeDocumentRepository();
  final firebaseUserRepository = FirebaseUserRepository();

  // final fakeUserRepository = FakeUserRepository();
  // final firestoreRepository = FirestoreDocumentRepository();
  @override
  Widget build(BuildContext context) {
    if (_error) {
      return ErrorWidget('exception');
    }
    if (!_initialized) {
      return CircularProgressIndicator();
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'for : season',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xFFF4DCDB)),
          focusColor: Color(0xFFF3C0C0),
          selectedRowColor: Color(0xFFF3C0C0),
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider.value(value: MyProvider()),
          ChangeNotifierProvider.value(
              value: LoginViewModel(firebaseUserRepository)),
          ChangeNotifierProvider.value(
              value: DocumentViewModel(fakeDocRepository))
        ], child: ProviderPage()));
  }
}
