// ignore_for_file: use_build_context_synchronously

import 'package:ds/helper/show_snackbar.dart';
import 'package:ds/screens/HomePage.dart';

import 'package:ds/screens/sign_up.dart';
import 'package:ds/screens/welcomePage.dart';
import 'package:ds/widgets/custom_botton_widget.dart';
import 'package:ds/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'loginPage';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  String? email, password;
  var obscuretxt = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode current = FocusScope.of(context);
            if (!current.hasPrimaryFocus) {
              current.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Welcome_Page()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    )),
              ),
            ),
            backgroundColor: const Color(0xffFFFFFF),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'images/messaging.png',
                        scale: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, top: 0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Login to continue using this app',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomTextFormFieldWithNext(
                      onChange: (p0) {
                        email = p0;
                      },
                      hintText: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    CustomTextFormFieldWithDone(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      onChange: (p0) {
                        password = p0;
                      },
                      hintText: 'Password',
                      obscuretext: obscuretxt,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuretxt = !obscuretxt;
                          });
                        },
                        icon: obscuretxt
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(Icons.visibility_off, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomBotonWidget(
                      radius: BorderRadius.circular(12),
                      color: Colors.blue,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await signinUser();
                            Navigator.pushNamed(
                              context,
                              arguments: email,
                              HomePage.id,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-email') {
                              showSnackBar(context, 'user not found');
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(context, 'Wrong Password');
                            }
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                      botonText: 'Login',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 83, 79, 79),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegesterPage.id);
                          },
                          child: const Text(
                            ' Sign up',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff0095F6)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signinUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}

//Sign out user method
Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}

//auth check
class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // User is logged in
          return HomePage();
        } else {
          // User not logged in
          return Welcome_Page();
        }
      },
    );
  }
}
