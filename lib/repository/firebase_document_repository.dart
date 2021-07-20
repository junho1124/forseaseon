import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/repository.dart';


class FirebaseDocumentRepository extends Repository<Document> {

final docRef = FirebaseFirestore
    .instance
    .collection('document')
    .withConverter(
    fromFirestore: (snapshot, _) => Document.fromJson(snapshot.data()),
    toFirestore: (document, _) => document.toJson(),
    );



  @override
  Future<void> add(Document item) async {
    await docRef.add(item);
  }

  @override
  Future<List<Document>> getAll() async {
  final documents = await docRef.get();
  return documents.docs.map((e) => e.data()).toList();
  }
}



