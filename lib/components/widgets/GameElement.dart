import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class GameElement extends StatelessWidget {
  final Game game;

  GameElement({Key key, @required this.game}) : super(key: key);

  Widget getButton(BuildContext context) {

    return (
      Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(flex: 1, child: Image.network(game.info.team1.imageUrl, width: 20, height: 20),),
          Expanded(flex: 4, child: Text(game.info.team1.teamName),),
          Expanded(flex: 2, child: Text(game.info.team1.score.toString(), style: TextStyle(color: Themedata.grey, fontSize: 24.0)),),
          Expanded(flex: 4, child: Text(game.dateTime),),
          Expanded(flex: 1, child: Icon(Icons.star),),
        ],),
        Row(children: <Widget>[
          Expanded(flex: 1, child: Image.network(game.info.team2.imageUrl, width: 20, height: 20),),
          Expanded(flex: 4, child: Text(game.info.team2.teamName),),
          Expanded(flex: 2, child: Text(game.info.team2.score.toString(), style: TextStyle(color: Themedata.grey, fontSize: 24.0)),),
          Expanded(flex: 4, child: Text(game.arena.name + "\n" + game.status),),
          Expanded(flex: 1, child: Icon(Icons.location_on),),
        ],),
        Row(children: <Widget>[
          Expanded(flex: 11, child: Column(
            children: <Widget>[
            Text(((game.leagueShortName != null) ? game.leagueShortName.toUpperCase() : ''),
                  style: TextStyle(color: Themedata.blue, fontSize: 12.0)),
            Text(((game.seasonName != null) ? game.seasonName.toUpperCase() : '') + ' | ' +
            ((game.seasonName != null) ? game.divisionName.toUpperCase() : ''),
                  style: TextStyle(color: Themedata.black, fontSize: 12.0)),
          ],)
          ,),
        ],),
      ],)
    );

    /*
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text(
                  game.info.team1.teamName +
                      " (" +
                      game.info.team1.score.toString() +
                      ")\n" +
                      game.info.team2.teamName +
                      " (" +
                      game.info.team2.score.toString() +
                      ")\n",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ),
            Expanded(
                flex: 4,
                child: Text(
                    game.dateTime + "\n" + game.arena.name + "\n" + game.status,
                    style: TextStyle(color: Colors.black, fontSize: 13.0))),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Text(((game.leagueShortName != null)
                      ? game.leagueShortName.toUpperCase()
                      : '') +
                  "\n" +
                  ((game.seasonName != null)
                      ? game.seasonName.toUpperCase()
                      : '') +
                  " | " +
                  ((game.divisionName != null)
                      ? game.divisionName.toUpperCase()
                      : '')),
            )
          ],
        )
      ],
    );
    */
  }

  onTapElement(BuildContext context) {
    final _list = Provider.of<GamesModel>(context);
    _list.selectedId = game.id;
    _list.selectedModel = game;
    Navigator.pushNamed(context, '/gamedetail');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
        ),      
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        // height: 100,
        child: getButton(context),
      ),
      onTap: () => onTapElement(context),
    );
  }
}
