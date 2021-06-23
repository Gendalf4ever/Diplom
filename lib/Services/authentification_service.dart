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

   print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {

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

    return('No user found for that email.');
   } else if (e.code == 'wrong-password') {
    return('Wrong password provided for that user.');
   }
  }
  return "Welcome";
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