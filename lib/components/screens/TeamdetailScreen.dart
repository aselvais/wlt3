import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Teamdata.dart';

class TeamdetailScreen extends StatelessWidget {
  final String _title = 'Teamdetail Screen';
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<TeamModel>(context);
    final Team team = teams.selectedModel.teaminfo;
    if (teams.loading == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: new Text('Team detail'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.network(team.imageUrl, width: 70, height: 70),
                      Text(team.teamName + " | " + team.divisionName , style: TextStyle(color: Colors.white, fontSize: 15,)),
                      Text(
                        team.win.toString() + '-' +
                        team.lose.toString() + '-' +
                        team.draw.toString()
                       , style: TextStyle(color: Colors.white, fontSize: 12,)
                       ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.favorite, color: Colors.white),
                      Text('Past Games', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.favorite, color: Colors.white),
                      Text('Standings', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.favorite, color: Colors.white),
                      Text('News', style: TextStyle(color: Colors.white),)
                    ],
                  ),


                ],),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                  child: Text(
                    team.teamName,  // _title,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
