import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/view_model/document_view_model.dart';
import 'package:provider/provider.dart';
class CreatePage extends StatefulWidget {
  final LoginUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    context.read<DocumentViewModel>().image;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DocumentViewModel>();
    File? image = context.watch<DocumentViewModel>().image;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              viewModel.uploadDocument(widget.user,
                  textEditingController.text);
              setState(() {
              Navigator.pop(context);
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            image == null ? Text('No Image') : Image.file(image),
            TextField(
              decoration: InputDecoration(hintText: '내용을 입력하세요.'),
              controller: textEditingController,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context
            .read<DocumentViewModel>()
            .getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}




