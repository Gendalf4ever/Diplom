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

   print('Пароль слишком слабый. Для обеспечения безопасности пожалуйста придумайте другой пароль');
  } else if (e.code == 'email-already-in-use') {

   print('Данный email уже зарегестрирован.');
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

    return('Пользователь с таким email не найден.');
   } else if (e.code == 'wrong-password') {
    return('Введен неверный пароль');
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