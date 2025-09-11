import 'package:chat_app/Widgets/constfile.dart';

class Message {
  final String message;

  Message(this.message);
  factory Message.formJson(Map<String, dynamic> jsondata) {
    return Message(jsondata[KMessage]);
  }
}
