import 'package:ds/models/message_model.dart';
import 'package:flutter/material.dart';

class Chat_Bubble extends StatelessWidget {
  const Chat_Bubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
        decoration: const BoxDecoration(
          color: Color(0xff034078),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class Chat_Bubble2 extends StatelessWidget {
  const Chat_Bubble2({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 10),
            child: Text(
              message.id!.split('@')[0].toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
            decoration: const BoxDecoration(
              color: Color(0xff1282A2),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
