// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ds/screens/HomePage.dart';
import 'package:ds/screens/HomePage.dart';
import 'package:ds/screens/chatPage.dart';
import 'package:ds/screens/login.dart';
import 'package:ds/screens/sign_up.dart';
import 'package:ds/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffFFFFFF),
            primarySwatch: Colors.blue,
            // hintColor: Colors.white,
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(backgroundColor: Color(0xff001F54))

            // Define other light theme properties here
            ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromARGB(255, 22, 22, 22),
              elevation: .5),
          scaffoldBackgroundColor: const Color.fromARGB(255, 39, 38, 38),
          // hintColor: Colors.white0xff001F54
          // Define other dark theme properties here
        ),
        themeMode: ThemeMode.system,
        routes: {
          Welcome_Page.id: (context) => Welcome_Page(),
          RegesterPage.id: (context) => const RegesterPage(),
          Login.id: (context) => const Login(),
          HomePage.id: (context) => HomePage(),
          chatPage.id: (context) => chatPage(),
          // New_Group.id: (context) => New_Group(),
        },
        debugShowCheckedModeBanner: false,
        home: const AuthCheck(),
      ),
    );
  }
}
