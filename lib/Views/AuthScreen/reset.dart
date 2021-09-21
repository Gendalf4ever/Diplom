import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ResetPage extends StatefulWidget {
  //Authorization({required Key key}) : super(key: key)
  // ignore: empty_constructor_bodies
  @override
  _ResetPageState createState() => _ResetPageState();

}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _emailController = TextEditingController();
  late String _email;
  bool showLogin = true;
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



    void resetPasswordButtonAction() async {
      _email = _emailController.text;


      if (_email.isEmpty);
      Fluttertoast.showToast(
          msg: "Введите пожалуйста почту ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //return
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




    Widget _form(String label, void press()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(Icon(Icons.email),"EMAIL",_emailController,false)
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
                Column(
                  children: <Widget>[
                    _form('Сбросить пароль', resetPasswordButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
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