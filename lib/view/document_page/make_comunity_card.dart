import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/view/document_page/community_detail.dart';

InkWell makeCommunityItem(LoginUser user, BuildContext context, Document document) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CommunityDetailPage(document)));
    },
    child: Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffe3eeff),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.profileUrl!),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('제목'), Text('이름, 시간')],
          ),
          Expanded(child: SizedBox(), flex: 5,),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.ac_unit_rounded),
                  Text('123')
                ],
              ),
              Row(
                children: [
                  Icon(Icons.ac_unit_rounded),
                  Text('123')
                ],
              ),
            ],
          ),
          // Container(),
        ],
      ),
    ),
  );
}