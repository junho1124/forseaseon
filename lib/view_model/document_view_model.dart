import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<List<DocumentInput>> makeInput(String title) async {
    List<DocumentInput>? inputList;
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('document')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image!, SettableMetadata(contentType: 'image/png'));

    final uri = await task.ref.getDownloadURL();

    inputList!.addAll([DocumentInput('image', uri), DocumentInput('text', title)]);

    return inputList;
  }

  Future<void> uploadDocument(LoginUser user, List<DocumentInput> input) async {
    await repository.add(Document(user, input, false, DateTime.now().millisecondsSinceEpoch, 0, 0));
    _docList = await repository.getAll();
    notifyListeners();
  }
}
