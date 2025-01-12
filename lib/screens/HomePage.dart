// ignore_for_file: file_names

import 'package:ds/screens/animations.dart';
import 'package:ds/screens/chatPage.dart';
import 'package:ds/screens/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff001F54),
        // backgroundColor: Color(0xff034078),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(createRoute(SettingsPage()));
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: 26,
              ),
            )),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, chatPage.id, arguments: email);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 80, 86, 90),
                ),
                height: 80,
                width: 400,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 65,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Icon(
                              color: Color(0xff000000),
                              Icons.person,
                              size: 55,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '  Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(
                width: 320,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
