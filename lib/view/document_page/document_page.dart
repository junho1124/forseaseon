import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/view/drawer/my_drawer.dart';

import 'community_tab.dart';

class MyDocumentPage extends StatelessWidget {
  MyDocumentPage(this.user);

  final LoginUser user;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '커뮤니티',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              bottom: communicationTabBar(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {  },
              child: Icon(Icons.add, color: Colors.black,),
              backgroundColor: Color(0xFFF4DCDB),
            ),
            body: TabBarView(
                children: [
              CommunityTab(user),
              CommunityTab(user),
              CommunityTab(user),
            ])));
  }



  TabBar communicationTabBar() {
    return TabBar(indicatorColor: Color(0xFF79C3FF), tabs: [
      Icon(
        Icons.people_alt_rounded,
        color: Colors.grey,
      ),
      Icon(Icons.star, color: Colors.grey),
      Icon(Icons.bookmark, color: Colors.grey),
    ]);
  }
}


