import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class GamedetailScreen extends StatelessWidget {
  final String _title = 'Game detail';
  @override
  Widget build(BuildContext context) {
    final Game game = Provider.of<GamesModel>(context).selectedModel;

    return Scaffold(
        appBar: AppBar(
          title: new Text(_title),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //margin: const EdgeInsets.all(5.0),
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                   Expanded(
                     child: Text(
                       game.info.team1.teamName + "\n" + 
                       game.info.team1.score.toString(), 
                     style: TextStyle(color: Colors.white))
                     ),
                   Expanded(
                     child: Text(game.info.team2.teamName + "\n" + 
                       game.info.team2.score.toString(), 
                     style: TextStyle(color: Colors.white))
                     ),
                  ],)
                ),
                Container(
                  // margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  child: Text('MENU ...', style: TextStyle(color: Colors.white))
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text('DATE / TIME', style: TextStyle(fontSize: 16.0)),
                      Text(game.dateTime),
                      Text(game.status),
                      Text('ARENA', style: TextStyle(fontSize: 16.0)),
                      Text(game.arena.name),
                      Text(game.arena.address),
                      Text('LEAGUE', style: TextStyle(fontSize: 16.0)),
                      Text(game.leagueShortName),
                      Text('SEASON', style: TextStyle(fontSize: 16.0)),
                      Text(game.seasonName),
                      Text('DIVISION', style: TextStyle(fontSize: 16.0)),
                      Text(game.divisionName),
                    ],
                  ),
                ),
              ],
            )));
  }
}
