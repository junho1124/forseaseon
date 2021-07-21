import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/fake_repository/fake_document_input_repository.dart';
import 'package:forseason/repository/fake_repository/fake_user_repository.dart';
import 'package:forseason/repository/repository.dart';

class FakeDocumentRepository extends Repository<Document> {
  @override
  Future<void> add(Document item) async {
    await Future.delayed(Duration(milliseconds: 10));

    documents.add(Document(item.user, item.documentInput, item.bookmark, item.dateTime, item.favoriteCount, item.visitorCount));
  }

  @override
  Future<List<Document>> getAll() async {
    await Future.delayed(Duration(seconds: 1));

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
