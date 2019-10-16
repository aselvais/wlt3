import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ColorList.dart';
import 'package:wlt3/components/lists/ListAbstract.dart';
import 'package:wlt3/components/widgets/Bottomnavigationwlt.dart';
import 'package:wlt3/components/widgets/Drawerwlt.dart';
import 'package:wlt3/components/widgets/Topmenubar.dart';
import 'package:wlt3/models/CartModel.dart';

class HomeScreen extends StatelessWidget {

  final List<Widget> _children = [
    ListAbstract(),
    ColorList(), // Container(color: Colors.white),
    Container(color: Colors.deepOrange),
    Container(color: Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return new Scaffold(
          drawer: new Drawerwlt(),
          appBar: new Topmenubar(),
          body: _children[cart.idx],
          bottomNavigationBar: new Bottomnavigationwlt()
    );
    
  }
}
