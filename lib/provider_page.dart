import 'package:flutter/material.dart';
import 'package:forseason/view/main_page/main_page.dart';
import 'package:forseason/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class ProviderPage extends StatefulWidget {


  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {

  @override
  Widget build(BuildContext context) {
    return context.watch<LoginViewModel>().user == null ? LoginPage() : MainPage();
  }
}
