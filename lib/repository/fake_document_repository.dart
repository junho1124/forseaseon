import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/fake_document_input_repository.dart';
import 'package:forseason/repository/fake_user_repository.dart';
import 'package:forseason/repository/repository.dart';

class FakeDocumentRepository extends Repository<Document> {
  @override
  void add(item) {
    // TODO: implement add
  }

  @override
  Future<List<Document>> getAll() async {
    return documents;
  }

  final List<Document> documents = [
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
    Document(FakeUserRepository().user, FakeDocumentInputRepository().input,
        false, TimeOfDay.minutesPerHour, 123, 123),
  ];
}
