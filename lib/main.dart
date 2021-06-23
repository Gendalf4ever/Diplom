import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pkgh_app/Views/splashscreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //!
  runApp(Main());
}


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PKGH System',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(title: TextStyle(color: Colors.white))
          //  primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }
}