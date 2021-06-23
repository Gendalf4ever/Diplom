import 'package:firebase_auth/firebase_auth.dart';

 class Userclass{
 late String? id;

Userclass.fromFirebase(User user){
id = user.uid;
}

}