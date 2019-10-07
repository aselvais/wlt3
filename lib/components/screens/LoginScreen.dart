import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget
{
  @override
  Column build(BuildContext context) {
    return Column(children: <Widget>[
      Center(child: Text('LoginScreen!'),),
      FlatButton(
        child: Text('Login button',style: TextStyle(fontSize: 25.0),),
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () { Navigator.pushNamed(context, '/home'); },
        
      )
    ],);
  }
  
}
