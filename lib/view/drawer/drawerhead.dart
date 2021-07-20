import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final LoginUser user;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(user.profileUrl!),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 42,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(user.profileUrl!),
                        ),
                        SizedBox(height: 8.0,),
                        Text(user.name!),
                        Text(user.email!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}