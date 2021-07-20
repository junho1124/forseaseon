import 'package:flutter/material.dart';
import 'package:forseason/view_model/login_view_model.dart';
import 'package:forseason/view_model/provider.dart';
import 'package:forseason/view/document_page/document_page.dart';
import 'package:forseason/view/main_page/main_page.dart';
import 'package:forseason/view/profile_page/profile_page.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'drawerhead.dart';

class MyDrawer extends StatefulWidget {

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<LoginViewModel>().repository.user!;
    final myProvider = context.watch<MyProvider>();

    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF4DCDB)),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                MyDrawerHeader(user: user),
                makeTiles(myProvider, 0, Icons.vertical_split_outlined, 'For : Seasons', MainPage()),
                makeTiles(myProvider, 1, Icons.account_circle_outlined, '프로필', MyProfilePge(user)),
                makeTiles(myProvider, 2, Icons.people_alt_rounded, '커뮤니티', MyDocumentPage(user)),
              ],
            ),
            SizedBox(),
            IconButton(onPressed: () {
              context.read<LoginViewModel>().logout();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
            } , icon: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  ListTile makeTiles(
      MyProvider myProvider, int index, IconData icon, String title, [Widget? page]) {
    return ListTile(
      leading: Icon(
        icon,
        color: myProvider.selected == index ? Color(0xFFE00503) : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: myProvider.selected == index
                ? Color(0xFFE00503)
                : Colors.black),
      ),
      selected: myProvider.selected == index,
      selectedTileColor: Color(0xFFF3C0C0),
      onTap: () {
        setState(() {
          myProvider.select(index);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page!));
        });
      },
    );
  }
}
