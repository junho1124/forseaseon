import 'package:forseason/model/document_input_model.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/repository/repository.dart';

class FakeDocumentInputRepository extends Repository<DocumentInput> {
  List<DocumentInput> input = [
    DocumentInput("title", "제목"),
    DocumentInput("text", "안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요\n"),
    DocumentInput("photo", "https://image.edaily.co.kr/images/photo/files/NP/S/2020/09/PS20090500039.jpg"),
  ];


  @override
  Future add(DocumentInput item) async {
    await Future.delayed(Duration(milliseconds: 10));

    input.add(DocumentInput(item.type, item.text));
  }

  @override
  Future<List<DocumentInput>> getAll() async {
    await Future.delayed(Duration(seconds: 1));

    return input;
  }

}