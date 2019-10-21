import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListGames.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';

class GamesScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    final League league = Provider.of<LeaguesModel>(context).selectedModel;
    final Season season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division division = Provider.of<DivisionsModel>(context).selectedModel;
    try {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(child: Text("Season:\n" + season.name),),
            Expanded(child: Text("Division:\n" + division.name),)
          ],),
          Expanded(
            flex: 1,
            child: Text(
              "Calendar Choice Widget\n" +
              league.id.toString() + " - " +
              season.id.toString() + " - " +
              division.id.toString()
            ),
            ),
          Expanded(
            flex: 9,
            child: ListGames(),
            ),
      ],)
    );
    } catch(e) {
      return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text(
            'Games',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black
              ),
          ),
        ),
    );
    }

  }
  
}
