import 'package:ds/screens/MyApp.dart';
import 'package:ds/screens/chatPage.dart';
import 'package:ds/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  return runApp(const MyApp());
  //initilization of Firebase app

  // other Firebase service initialization
}


class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    // Check if user is logged in
    if (user == null) {
      // User not logged in, show login screen
      return Login();
    } else {
      // User is logged in, show chat screen
      return chatPage();
    }
  }
}