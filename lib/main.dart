import 'package:flutter/material.dart';
import 'package:pkgh_app/Views/authorization.dart';
import 'package:pkgh_app/Views/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Views/table.dart';
import 'Views/home.dart';
Future<void> main() async {
   await Firebase.initializeApp(); //!
  runApp(Main());
}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(title: TextStyle(color: Colors.white))
      //  primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home:LandingPage()
    );
  }
}

