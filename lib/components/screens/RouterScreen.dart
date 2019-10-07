import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ColorList.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';

class RouterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Win Lose or Tie',
      initialRoute: '/',
      routes: {
        '/': (context) => new HomeScreen(),
        '/standing': (context) => new ColorList(),
//        '/leagues': (context) => new ListAbstract(),
 //       '/favorite': (context) => new ListAbstract(),
      }
    );
  }
}
