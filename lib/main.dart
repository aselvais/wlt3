import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ColorList.dart';
import 'package:wlt3/components/lists/ListAbstract.dart';
import 'package:wlt3/components/widgets/Bottomnavigationwlt.dart';
import 'package:wlt3/components/widgets/Drawerwlt.dart';
import 'package:wlt3/components/widgets/Topmenubar.dart';
import 'package:wlt3/libs/Themedata.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Themedata.primarySwatch,
        primaryColor: Themedata.primaryColor,
        accentColor: Themedata.accentColor,
        canvasColor: Themedata.canvasColor,
      ),
      home: new Scaffold(
        drawer: new Drawerwlt(),
        appBar: new Topmenubar(),
        body: new ColorList(), // ListAbstract(),
        bottomNavigationBar: new Bottomnavigationwlt()),
    );
  }
}
