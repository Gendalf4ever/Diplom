import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pkgh_app/Services/auth.dart';
import 'package:pkgh_app/Services/authentification_service.dart';
import 'package:pkgh_app/Views/user.dart';
class Authorization extends StatefulWidget {
  //Authorization({required Key key}) : super(key: key)
  // ignore: empty_constructor_bodies
  @override
 _AuthorizationState createState() => _AuthorizationState();

}

class _AuthorizationState extends State<Authorization> {
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
late String _email;
late String _password;
bool showLogin = true;
AuthorizationService _authorizationService = AuthorizationService();



  @override
  Widget build(BuildContext context){
    Widget _logo(){
return Padding(
  padding: EdgeInsets.only(top: 100),
  child: Container(
    child: Align(
      child: Text('PKGH System',
      style: TextStyle(fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      ),
    ),
  ),
);
    }

    Widget _input(Icon icon, String hint,
        TextEditingController controller, bool obscure){
        return Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: controller,
              obscureText: obscure,
              style: TextStyle(
                  fontSize: 20, color: Colors.white
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20, color: Colors.white
                ),
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.white,
                  width: 3
                  ),
                ),
                 enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                   color: Colors.white54,
                    width: 1),
      ),
      prefixIcon: Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: IconTheme(
      data: IconThemeData(color: Colors.white),
      child: icon,
      ),
      )
            ),
            )
        );
    }

    void loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty);
     Fluttertoast.showToast(
         msg: "Введите пожалуйста логин и пароль",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 5,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0
     );
      //return
      Userclass user = (await  _authorizationService.signInWithEmailAndPassword(_email.trim(), _password.trim())) as Userclass;

      if (user == null) {
        Fluttertoast.showToast(
            msg: "Ошибка входа. Проверьте пожалуйста логин и пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
      _emailController.clear();
      _passwordController.clear();
    }
    }

    void registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty);
      Fluttertoast.showToast(
          msg: "Введите пожалуйста логин и пароль",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //return
      Userclass user = (await  _authorizationService.registerWithEmailAndPassword(_email.trim(), _password.trim())) as Userclass;

      if (user == null) {
        Fluttertoast.showToast(
            msg: "Ощибка регистрации. Проверьте пожалуйста логин и пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }



    Widget _bottomWave(){
      return Expanded(
          child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
            alignment: Alignment.bottomCenter,
      ),
      );
    }
    Widget _button(String text, void press()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
          fontSize: 20
          ),
        ),
        onPressed: (){
          press();
        },

      );
    }


    /*
    Widget _registerButton(String text, void press()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(
          "Зарегистрироваться",
          style: TextStyle(fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 20
          ),
        ),
        onPressed: (){
          press();
        },
      );
    }
    */


Widget _form(String label, void press()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email),"EMAIL",_emailController,false)
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(Icon(Icons.lock),"PASSWORD",_passwordController,true)
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, press),
              ),
            ),

            /*
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _registerButton(label, press),
              ),
            ),

           */

          ],
        ),
      );
}
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
body: Column(
  children: <Widget>[
    _logo(),
    SizedBox(height: 50),
    (
        showLogin
        ? Column(
          children: <Widget>[
            _form('Login',loginButtonAction),

            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                child: Text('Не заригестрирован? Зарегестрируйся!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                ),
                onTap:(){
                  setState((){
                    showLogin = true;
              });
              },
              ),
            ),
          ],
        )
        :
        Column(
          children: <Widget>[
            _form('Register', registerButtonAction),
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                child: Text('Заригестрирован? Зайди!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
                onTap:(){
                  setState((){
                    showLogin = false;
                  });
                },
              ),

            ),
          ],
        )
    ),

    _bottomWave(),
  ]
),
    );
  }
}
class BottomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}