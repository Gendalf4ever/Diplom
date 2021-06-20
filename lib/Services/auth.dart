import 'package:firebase_auth/firebase_auth.dart';
import 'package:pkgh_app/Views/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthorizationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future <User?> signInWithEmailAndPassword(String email, String password) async {

    try{

      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     // User? user = result.user; //! возвращает весь юзер
      //return user;
      User? userr = result.user;
      Future<User> tuts = Userclass.fromFirebase(userr!) as Future<User>;
      return tuts;
    }catch(e){
      print(e);
     return null;
    } //catch
  } //try


  Future <User?> registerWithEmailAndPassword(String email, String password) async {

    try{

      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? userr = result.user;
      Future<User> tuts = Userclass.fromFirebase(userr!) as Future<User>;
      return tuts;
    }catch(e){
      print(e);
      return null;
    } //catch
  } //try

Future logOut() async {
    await _firebaseAuth.signOut(); //на будущее
}
/*
Stream<User> get currentUser{
    return _firebaseAuth.authStateChanges().asyncMap((User user) => user != null ? Userclass.fromFirebase(user): null); //подключение к потоку
       // .map((User user) => user != null ? Userclass.fromFirebase(user): null);
} //Stream
*/
}





