import 'package:flutter/cupertino.dart';
import 'package:forseason/model/document_input_model.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/fake_document_input_repository.dart';
import 'package:forseason/repository/repository.dart';

class DocumentInputViewModel extends ChangeNotifier {
  Repository<DocumentInput> inputRepository;

  DocumentInputViewModel(this.inputRepository);

  List<DocumentInput> docList = [];

  Future<void> fetch() async {
    docList = await inputRepository.getAll();
  }
}