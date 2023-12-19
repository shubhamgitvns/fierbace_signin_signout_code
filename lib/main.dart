import 'dart:convert';
import 'google_signIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  //while(true)
  {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
    } catch (e) {}
  }
  runApp(FirebaseDemo());
}

class FirebaseDemo extends StatefulWidget {
  // static FirebaseFirestore firestoredb; //=FirebaseFirestore.instance;
  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  String username = "", chatmessage = "", status = "Messages";
  TextEditingController textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    firebaseInit();
  }

  void firebaseInit() {
    try {

    } catch (ee) {
      print(ee);
    }
  }

  _FirebaseDemoState() {}
  String firebasedata = "data";


  //*****************************************************************************

  String loginfo = "Login & Logout";
  String data = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text(loginfo),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(data),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await VsjGoogleSignIn.doSignIn();
                      User? user = await VsjGoogleSignIn.getUser();
                      if (user == null) {
                        data = "NULL";
                      } else {
                        data = user.displayName!;
                      }
                    } catch (ex) {
                      data = ex.toString();
                    }
                    setState(() {});
                  },
                  child: const Text("sign in")),
              ElevatedButton(
                  onPressed: () async {
                    await VsjGoogleSignIn.doSignOut();
                    data="Successfully sign out";
                  },
                  child: const Text("sign out"))
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}