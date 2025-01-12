class Message {
  final String message;
  final String? id;
  Message({required this.message, required this.id});

  factory Message.fromjson(jsondata) {
    return Message(message: jsondata['message'], id: jsondata['id']);
  }
}
