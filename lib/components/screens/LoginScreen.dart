import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'LoginScreen!',
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
              ),
              FlatButton(
                child: Text(
                  'Login button',
                  style: TextStyle(fontSize: 25.0),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              )
            ],
          )),
        ],
      ),
    );
  }
}
