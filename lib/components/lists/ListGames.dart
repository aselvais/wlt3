import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class ListGames extends StatelessWidget {

  Widget getButton(BuildContext context, Game f)
  {
    return 
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text(
                f.info.team1.teamName + " (" + f.info.team1.score.toString() + ")\n" + 
                f.info.team2.teamName + " (" + f.info.team2.score.toString() + ")\n", 
                textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 14.0)
                ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                f.dateTime + "\n" +
                f.arena.name + "\n" +
                f.status,
                style: TextStyle(color: Colors.black, fontSize: 13.0)
                )
            ),
          ],
        ),
        Row(children: <Widget>[
          Expanded(
            flex: 10,
            child: Text(
              f.leagueShortName.toUpperCase() + "\n" + 
              f.seasonName.toUpperCase() + " | " + f.divisionName.toUpperCase()
            ),
            )
        ],)       
      ],
    );
  }

  onTapElement(BuildContext context, Game model)
  {
    final _list = Provider.of<GamesModel>(context);
    _list.selectedId = model.id;
    _list.selectedModel = model;
    Navigator.pushNamed(context, '/gamedetail');
  }

  @override
  Widget build(BuildContext context) {
    
    final _list = Provider.of<GamesModel>(context);

    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (Game f) => wl.add(
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              // height: 100, 
              color: Colors.amber[600],
              child: getButton(context, f),
            ),
            onTap: () => onTapElement(context, f),
          )
        )
      );
      return ListView(children: wl,);
    }


  }
}
