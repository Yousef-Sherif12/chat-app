import 'package:ds/screens/login.dart';
import 'package:ds/screens/sign_up.dart';
import 'package:ds/widgets/custom_botton_widget.dart';
import 'package:flutter/material.dart';

class Welcome_Page extends StatelessWidget {
  const Welcome_Page({super.key});
  static String id = 'welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/Vector1.jpg',
            width: double.infinity,
            scale: .9,
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Image.asset(
              'images/messaging.png',
              scale: 2.5,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Welcome to the chat app',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              "Let's start using the app",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10.0),
            child: CustomBotonWidget(
              radius: BorderRadius.circular(23),
              color: Color(0xff60A917),
              botonText: 'Sign in',
              onTap: () {
                Navigator.pushNamed(context, Login.id);
              },
            ),
          ),
          // SizedBox(
          //   height: ,
          // ),
          Stack(children: [
            Image.asset(
              'images/Vector2.png',
              width: double.infinity,
              scale: .9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: CustomBotonWidget(
                radius: BorderRadius.circular(23),
                color: Color(0xff60A917),
                botonText: 'Creat New Account',
                onTap: () {
                  Navigator.pushNamed(context, RegesterPage.id);
                },
              ),
            ),
          ])
        ],
      ),
    );
  }
}
