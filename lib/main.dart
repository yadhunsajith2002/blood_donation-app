import 'package:blood_donate_app/screens/add.dart';
import 'package:blood_donate_app/screens/home.dart';
import 'package:blood_donate_app/screens/update.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddUser(),
        '/update':(context) => UpdateDonor(),
      },
      initialRoute: '/',
    );
  }
}
