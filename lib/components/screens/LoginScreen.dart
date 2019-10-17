import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: 
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network('http://www.winloseortie.com/wp-content/themes/pogon/images/WLT-Logo.jpg'),
              FlatButton(
                child: Text(
                  'Login button',
                  style: TextStyle(fontSize: 25.0),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  final _list = Provider.of<LeaguesModel>(context);
                  _list.loadData();
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ])
            )
            );
  }
}
