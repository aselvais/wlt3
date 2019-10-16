import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class ListAbstract extends StatelessWidget {

  @override
  ListView build(BuildContext context) {
    List<Widget> wl = new List();
    var _list = Provider.of<LeaguesModel>(context);
    _list.list.forEach((f) => wl.add(Center(child: Text(f["name"]))) );
    return ListView(children: wl,);
  }
}
