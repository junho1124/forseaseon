import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';

class ProfilImage extends StatelessWidget {
  const ProfilImage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final LoginUser user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    user.profileUrl!,
                    fit: BoxFit.cover,
                  ))),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '123',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Lv',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold,
                        color: Colors.grey,),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '123',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}