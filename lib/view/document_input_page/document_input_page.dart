import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final LoginUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future _getImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _uploadPost();
            },
          )
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _uploadPost() async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('document')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image!, SettableMetadata(contentType: 'image/png'));

    final uri = await task.ref.getDownloadURL();

    var doc = FirebaseFirestore.instance.collection('document').doc();
    await doc.set({
      'id': doc.id,
      'photoUrl': uri.toString(),
      'contents': textEditingController.text,
      'email': widget.user.email,
      'displayName': widget.user.name,
      'userPhotoUrl': widget.user.profileUrl
    });
    Navigator.pop(context);
  }


  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image!),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

}
