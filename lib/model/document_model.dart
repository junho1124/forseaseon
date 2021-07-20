
import 'document_input_model.dart';
import 'login_user_model.dart';

class Document {
  LoginUser? user;
  List<DocumentInput>? documentInput;
  bool? bookmark;
  int? dateTime;
  int? favoriteCount;
  int? visitorCount;

  Document(
    this.user,
    this.documentInput,
    this.bookmark,
    this.dateTime,
    this.favoriteCount,
    this.visitorCount);

  Document.fromJson(dynamic json) {
    user = json["user"];
    documentInput = json["documentInput"];
    bookmark = json["bookmark"];
    dateTime = json["dateTime"];
    favoriteCount = json["favoriteCount"];
    visitorCount = json["visitorCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user"] = user;
    map["documentInput"] = documentInput;
    map["bookmark"] = bookmark;
    map["dateTime"] = dateTime;
    map["favoriteCount"] = favoriteCount;
    map["visitorCount"] = visitorCount;
    return map;
  }

}