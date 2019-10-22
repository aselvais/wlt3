import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListGames.dart';
import 'package:wlt3/components/widgets/DateAndTimePickerDemo.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';


class GamesScreen extends StatelessWidget
{

  onTapSeasons(BuildContext context)
  {
    Navigator.pushNamed(context, '/seasons');
  }

  onTapDivisions(BuildContext context)
  {
    Navigator.pushNamed(context, '/divisions');
  }

  onTapDate(BuildContext context)
  {
    Navigator.pushNamed(context, '/pickdate');
  }

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
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: <Widget>[
              Expanded(child: InkWell(child: Text("Season: " + season.name + " > "), onTap: () => onTapSeasons(context)), ),
              Expanded(child: InkWell(child: Text("Division: " + division.name + " > "), onTap: () => onTapDivisions(context)),)
            ],),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: InkWell(child:  Text(
                "Calendar Choice Widget: " +
                league.id.toString() + " - " +
                season.id.toString() + " - " +
                division.id.toString(),
                style: TextStyle(color: Colors.white)
              ),
              onTap: () => onTapDate(context),),
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
