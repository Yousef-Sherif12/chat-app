import 'package:ds/helper/show_snackbar.dart';
import 'package:ds/screens/HomePage.dart';
import 'package:ds/screens/login.dart';
import 'package:ds/screens/welcomePage.dart';
import 'package:ds/widgets/custom_botton_widget.dart';
import 'package:ds/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegesterPage extends StatefulWidget {
  const RegesterPage({super.key});
  static String id = 'regesterPage';

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  late String email, password;

  bool isloading = false;
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
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
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Enter your personal infornation',
                        style: TextStyle(color: Colors.grey[600], fontSize: 15),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    CustomTextFormFieldWithNext(
                      onChange: (data) {
                        email = data;
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
                      obscuretext: obscuretxt,
                      onChange: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuretxt = !obscuretxt;
                          });
                        },
                        icon: obscuretxt
                            ? Icon(Icons.visibility, color: Colors.black)
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
                            await regesterUser();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, HomePage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak-password') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context, 'week password');
                            } else if (ex.code == 'email-already-in-use') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context, 'email-already-used');
                            }
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                      botonText: 'Regester',
                    ),
                    const SizedBox(
                      height: 15,
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
                          'Already have an account?',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Login.id);
                          },
                          child: const Text(
                            ' Sign in',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff0095F6)),
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

  Future<void> regesterUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}

Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}
