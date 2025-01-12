import 'package:ds/screens/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // ignore: unused_element
  void _changeTheme(ThemeData theme) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff001F54),
          // backgroundColor: const Color(0xff034078),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 26,
                ),
              )),
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            //   child: Column(
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           _showThemeDialog(context);
            //         },
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: const Color(0xff1282A2),
            //               borderRadius: BorderRadius.circular(22)),
            //           height: 65,
            //           width: 400,
            //           // color: Colors.rey,
            //           child: const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 20),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.nightlight,
            //                   color: Colors.white,
            //                   size: 30,
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text(
            //                   'Themes',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.w600),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //   child: Column(
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           _showLanguageDialog(context);
            //         },
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: const Color(0xff034078),
            //               borderRadius: BorderRadius.circular(22)),
            //           height: 65,
            //           width: 400,
            //           // color: Colors.rey,
            //           child: const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 20),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.language,
            //                   color: Colors.white,
            //                   size: 30,
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text(
            //                   'Language',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.w600),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff034078),
                        borderRadius: BorderRadius.circular(22)),
                    height: 65,
                    width: 400,
                    // color: Colors.rey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance.signOut();
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(context, Welcome_Page.id);
                                // ignore: empty_catches
                              } catch (e) {}
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

// class Settings_Category extends StatelessWidget {
//   const Settings_Category({super.key, required this.category});
//   final String category;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:     );
//   }
// }

  // void _showThemeDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Color.fromARGB(255, 66, 113, 136),
  //         title: Text(
  //           'Select Theme',
  //           style: TextStyle(
  //               color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               leading: Icon(
  //                 Icons.light_mode,
  //                 color: Colors.white,
  //                 size: 32,
  //               ),
  //               title: Text(
  //                 'Light Theme',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               onTap: () {
  //                 _changeTheme(ThemeData.light());
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             Divider(
  //               color: const Color.fromARGB(255, 130, 190, 219),
  //             ),
  //             ListTile(
  //               leading: Icon(
  //                 Icons.dark_mode,
  //                 color: Colors.white,
  //                 size: 32,
  //               ),
  //               title: Text(
  //                 'Dark Theme',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               onTap: () {
  //                 _changeTheme(ThemeData.dark());
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // void _showLanguageDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: const Color.fromARGB(255, 66, 113, 136),
  //         title: const Text(
  //           'Select Language',
  //           style: TextStyle(
  //               color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               title: const Text(
  //                 'Arabic',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               onTap: () {
  //                 _changeTheme(ThemeData.light());
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             const Divider(
  //               color: Color.fromARGB(255, 130, 190, 219),
  //             ),
  //             ListTile(
  //               title: const Text(
  //                 'English',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               onTap: () {
  //                 _changeTheme(ThemeData.dark());
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
