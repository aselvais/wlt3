import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class ListAbstract extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<LeaguesModel>(context);
    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (f) => wl.add(
          Center(
            child: Text(f.name, style: TextStyle(color: Colors.black, fontSize: 16.0))
          )
        )
      );
      return ListView(children: wl,);
    }


  }
}
