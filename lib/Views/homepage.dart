import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkgh_app/Services/authentification_service.dart';
import 'package:pkgh_app/Views/authorization.dart';

class PageHome extends StatefulWidget{
  @override
 _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  // String? email = FirebaseAuth.instance.currentUser!.email;
  String? email = FirebaseAuth.instance.currentUser!.email;
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Welcome"),
      actions: [
        IconButton(
            icon: Icon(
                Icons.exit_to_app
            ),
            onPressed: (){ //Sign Out Method
            Authclass().signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Authorization()), (route) => false);
        }
        )
      ],
    ),
    body: Center(
      child: Text("Email $email"),
    ),
  );
  }

}
