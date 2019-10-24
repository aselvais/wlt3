import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';

class GamedetailScreen extends StatelessWidget {
  final String _title = 'Game detail';

  onTapTeam(BuildContext context, Team team) {
    final TeamModel teammodel = Provider.of<TeamModel>(context);
    teammodel.loadData(team.teamId);
    Navigator.pushNamed(context, '/teamdetail');
  }

  onTapCalendar(BuildContext context) {
    print('onTapCalendar');
  }

  onTapMap(BuildContext context) {
    print('onTapMap');
  }

  onTapShare(BuildContext context) {
    print('onTapShare');
  }

  onTapFavorite(BuildContext context) {
    print('onTapFavorite');
  }

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
                height: 200,
                padding: const EdgeInsets.all(10.0),
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () => onTapTeam(context, game.info.team1),
                      child: Column(
                        children: <Widget>[
                          Image.network(game.info.team1.imageUrl,
                              width: 100, height: 100),
                          Text(
                              game.info.team1.teamName +
                                  "\n" +
                                  game.info.team1.score.toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () => onTapTeam(context, game.info.team2),
                      child: Column(
                        children: <Widget>[
                          Image.network(game.info.team2.imageUrl,
                              width: 100, height: 100),
                          Text(
                              game.info.team2.teamName +
                                  "\n" +
                                  game.info.team2.score.toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )),
                  ],
                )),
            Container(
                // margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Colors.white),
                          Text('ADD TO CALENDAR | ',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      onTap: () => onTapCalendar(context),
                    ),
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.map, color: Colors.white),
                          Text('VIEW ON MAP | ',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      onTap: () => onTapMap(context),
                    ),
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.share, color: Colors.white),
                          Text('SHARE | ',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      onTap: () => onTapShare(context),
                    ),
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.white),
                          Text('FAVORITE',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      onTap: () => onTapFavorite(context),
                    ),
                  ],
                )),
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
