import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forseason/model/document_input_model.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/repository/repository.dart';
import 'package:image_picker/image_picker.dart';

class DocumentViewModel extends ChangeNotifier {
  DocumentViewModel(this.repository);

  final Repository<Document> repository;

  File? _image;

  final picker = ImagePicker();

  List<Document> _docList = [];

  List<Document> get docList => _docList;

  File? get image => _image;

  Future getImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    _image = File(image!.path);
    notifyListeners();
  }

  Future<void> fetch() async {
    _docList = await repository.getAll();
    notifyListeners();
  }

  // Future<void> uploadExample() async {
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String filePath = '${appDocDir.absolute}/file-to-upload.png';
  //   // ...
  //   // e.g. await uploadFile(filePath);
  // }
  //
  // Future<void> uploadFile(String filePath) async {
  //   File file = File(filePath);
  //
  //   try {
  //     await firebase_storage.FirebaseStorage.instance
  //         .ref('uploads/file-to-upload.png')
  //         .putFile(file);
  //   } on FirebaseException catch (e) {
  //     // e.g, e.code == 'canceled'
  //   }
  // }

  Future<void> uploadDocument(LoginUser user, String title) async {

    final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('document')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image!, firebase_storage.SettableMetadata(contentType: 'image/png'));

    final uri = await task.ref.getDownloadURL();
    print(user.toString());
    var doc = FirebaseFirestore.instance.collection('document').doc();
    await doc.set({
      'user' : user,
      'documentInput' : {
        'image' : uri,
        'text' : title
      },
      'bookmark' : null,
      'dateTime' : DateTime.now().millisecondsSinceEpoch,
      'favoriteCount' : 0,
      'visitorCount' : 0
    });
    // await repository.add(Document(user, inputList, false, DateTime.now().millisecondsSinceEpoch, 0, 0));
    // _docList = await repository.getAll();
    notifyListeners();
  }
}
