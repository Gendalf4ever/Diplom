import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkgh_app/Views/AuthScreen/register.dart';
import 'package:pkgh_app/Views/authorization.dart';
import 'package:pkgh_app/Views/homepage.dart';
import 'home.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      if (auth.currentUser == null){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Authorization()),
                (route) => false);
      } else
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => PageHome()),
                (route) => false);
    }
    );
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 80),
      ),
    );
  }
}
