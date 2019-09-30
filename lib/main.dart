import 'package:flutter/material.dart';
import 'package:wlt3/components/widgets/Bottomnavigationwlt.dart';
import 'package:wlt3/components/widgets/Drawerwlt.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AppBar getAppBar(title) {
    return new AppBar(title: new Text(title));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawerwlt(),
      appBar: this.getAppBar('WLT 3.0'),
      body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 1,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item! $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
      ),
      bottomNavigationBar: new Bottomnavigationwlt()
    );
  }
}
