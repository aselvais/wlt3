import 'package:flutter/material.dart';
import 'package:wlt3/components/screens/MyCatalog.dart';
import 'package:wlt3/components/widgets/Bottomnavigationwlt.dart';
import 'package:wlt3/components/widgets/Drawerwlt.dart';
import 'package:wlt3/components/widgets/Topmenubar.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          drawer: new Drawerwlt(),
          appBar: new Topmenubar(),
          // body: ListAbstract(),
          body: MyCatalog(),
          bottomNavigationBar: new Bottomnavigationwlt()
    );
    
  }
}
