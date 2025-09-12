import 'package:chat_app/Widgets/constfile.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);
  factory Message.formJson(Map<String, dynamic> jsondata) {
    return Message(jsondata[KMessage], jsondata["id"]);
  }
}
