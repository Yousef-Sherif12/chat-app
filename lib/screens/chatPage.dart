// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:ds/models/message_model.dart';
import 'package:ds/screens/HomePage.dart';
import 'package:ds/screens/animations.dart';
import 'package:ds/widgets/chat_bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class chatPage extends StatelessWidget {
  chatPage({super.key});
  static String id = 'chatPage';
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapShot.data!.docs.length; i++) {
              messagesList.add(
                Message.fromjson(snapShot.data!.docs[i]),
              );
            }
            return SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode current = FocusScope.of(context);
                  if (!current.hasPrimaryFocus) {
                    current.unfocus();
                  }
                },
                child: Scaffold(
                  // backgroundColor: Colors.white,
                  appBar: AppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                            onPressed: () {
                              _confirmDeleteAllMessages(context);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      )
                    ],
                    automaticallyImplyLeading: true,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () =>
                          Navigator.of(context).pop(createRoute(HomePage())),
                    ),
                    // leading: IconButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const SettingsPage(),
                    //           ));
                    //     },
                    //     icon: const Padding(
                    //       padding: EdgeInsets.only(left: 16),
                    //       child: Icon(
                    //         Icons.settings,
                    //         color: Colors.white,
                    //         size: 26,
                    //       ),
                    //     )),
                    backgroundColor: const Color(0xff001F54),

                    title: Row(
                      children: [
                        SizedBox(
                          width: 80,
                        ),
                        Image.asset(
                          'images/messaging.png',
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Chat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    centerTitle: true,

                    // actions: [
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: IconButton(
                    //       icon: const Icon(Icons.logout),
                    //       onPressed: () async {
                    //         try {
                    //           await FirebaseAuth.instance.signOut();
                    //           Navigator.pushNamed(context, Login.id);
                    //           // ignore: empty_catches
                    //         } catch (e) {}
                    //       },
                    //       color: Colors.white,
                    //     ),
                    //   )
                    // ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,

                          controller: _controller,
                          itemCount: messagesList.length,
                          // ignore: non_constant_identifier_names
                          itemBuilder: (Context, index) {
                            return messagesList[index].id == id
                                ? Chat_Bubble(
                                    message: messagesList[index],
                                  )
                                : Chat_Bubble2(message: messagesList[index]);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (data) {
                            if (controller.text.trim().isNotEmpty) {
                              messages.add({
                                'message': data,
                                'id': id,
                                'createdAt': DateTime.now(),
                              });
                            }
                            controller.clear();
                            _controller.animateTo(0,
                                duration: const Duration(microseconds: 500),
                                curve: Curves.ease);
                          },
                          decoration: InputDecoration(
                            ///////////   FocusedBorder   ///////////
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 16, 147, 255),
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            ///////////    DisabledBorder    ///////////
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 16, 147, 255),
                              ),
                            ),
                            hintText: '    Send Message',
                            hintStyle: const TextStyle(
                                // color: Colors.black,
                                fontWeight: FontWeight.w500),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () {
                                  if (controller.text.trim().isNotEmpty) {
                                    messages.add({
                                      'message': controller.text.trim(),
                                      'id': id,
                                      'createdAt': DateTime.now(),
                                    });
                                    _controller.animateTo(0,
                                        duration:
                                            const Duration(microseconds: 500),
                                        curve: Curves.ease);
                                  }
                                  controller.clear();
                                },
                                icon: const Icon(Icons.send),
                                color: const Color.fromARGB(255, 16, 147, 255),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 44, 84, 117)),
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const ModalProgressHUD(inAsyncCall: true, child: Text(''));
        });
  }

  Future<void> _confirmDeleteAllMessages(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Delete All Messages',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 16, 147, 255),
            ),
          ),
          content: const Text(
            'Are you sure you want to delete all messages? This action cannot be undone.',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 16, 147, 255)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromARGB(255, 16, 147, 255)),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Delete All',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromARGB(255, 16, 147, 255)),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await _deleteAllMessages();
    }
  }

  Future<void> _deleteAllMessages() async {
    try {
      // Get a reference to the messages collection
      CollectionReference messagesRef =
          FirebaseFirestore.instance.collection('messages');

      // Get all messages
      QuerySnapshot snapshot = await messagesRef.get();

      // Delete each message
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      // Optionally, show a success message
      // ignore: avoid_print
      print('All messages deleted successfully');
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      print('Error deleting messages: $e');
    }
  }
}
