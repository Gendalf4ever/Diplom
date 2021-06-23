import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authclass{
 FirebaseAuth auth = FirebaseAuth.instance;

 //Create Account
Future<String> createAccount({ required String email,  required String password}) async {
  try {
 await auth.createUserWithEmailAndPassword(
      email: email,
      password: password
  );
 } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   Fluttertoast.showToast(
       msg: "Слабый пароль. Придумайте другой пароль",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 5,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
   print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
   Fluttertoast.showToast(
       msg: "Данный пользователь уже зарегестрирован",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 5,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
   print('The account already exists for that email.');
  }
 } catch (e) {
  print(e);
 }
return "Account created";
}

//Sign in user


 Future<String> signIn({ required String email,  required String password}) async {
  try {
   await auth.signInWithEmailAndPassword(
       email: email,
       password:password
   );
  } on FirebaseAuthException catch (e) {
   if (e.code == 'user-not-found') {
    Fluttertoast.showToast(
        msg: "Данный email не найден",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print('No user found for that email.');
   } else if (e.code == 'wrong-password') {
    Fluttertoast.showToast(
        msg: "Неверный пароль",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print('Wrong password provided for that user.');
   }
  }
  return "User signed in";
 }

 //Reset Password

 Future<String> resetPassword({ required String email}) async {
  try {
   await auth.sendPasswordResetEmail(
       email: email
   );
  } catch(e){
    return "error occured";
  }
  return "Done";
 }
 //Sign Out
void signOut(){
 auth.signOut();
}
}