import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String id = "mainpage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: MaterialButton(
        onPressed: () {
          DatabaseReference dbref =
              FirebaseDatabase.instance.ref().child('Test');
          dbref.set('IsConnected');
        },
        height: 70,
        minWidth: 300,
        color: Colors.green,
        child: const Text('test connection'),
      ),
    );
  }
}
