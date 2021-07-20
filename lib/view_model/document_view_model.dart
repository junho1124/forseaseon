import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/repository.dart';

class DocumentViewModel extends ChangeNotifier {
  DocumentViewModel(this.repository);

  final Repository<Document> repository;

  List<Document> docList = [];

  Future<void> fetch() async {
    docList = await repository.getAll();
  }

}
