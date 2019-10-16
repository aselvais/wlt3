import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class ListAbstract extends StatelessWidget {

  int _idx = 0;

  void onItemTapped(context) {
    final _list = Provider.of<LeaguesModel>(context);
    _idx++;
    _list.addToList({
          "id": "162",
          "name": "BELGIAN KINGS " + _idx.toString() + " !!!",
          "shortName": "Avenue Road Hockey Association",
          "imageUrl":"http://admin.winloseortie.com/files/image?directory=team_images&filename=ADX_ARHALogo2.png",
          "androidAppURL":"https://play.google.com/store/apps/details?id=com.winloseortie",
          "iosAppURL": ""
        });
  }

  getFlatButton(context)
  {
    return FlatButton(
        child: Text('Add league', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () => onItemTapped(context)
        );
  }

  @override
  ListView build(BuildContext context) {
    List<Widget> wl = new List();
    wl.add(getFlatButton(context));
    final _list = Provider.of<LeaguesModel>(context);
    _list.list.forEach(
      (f) => wl.add(
        Center(
          child: Text(f["name"], 
          style: TextStyle(color: Colors.black, fontSize: 16.0))
        )
      )
    );
    return ListView(children: wl,);
  }
}
