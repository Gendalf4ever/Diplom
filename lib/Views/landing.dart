import 'package:flutter/cupertino.dart';
import 'package:pkgh_app/Views/authorization.dart';
import 'package:pkgh_app/Views/home.dart';
import 'package:flutter/material.dart';
class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage() : Authorization();

  }
}