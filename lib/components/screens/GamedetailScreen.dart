import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/FormaterElem.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/Team.dart';

class GamedetailScreen extends StatelessWidget {
  final String _title = 'Game detail';

  onTapTeam(BuildContext context, Team team) 
  {
    ActionsComposite.goToTeamDetailScreen(context, team.teamId);    
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

  Widget getTopBar(BuildContext context)
  {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
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
                ));
  }

  Widget getButton(BuildContext context, IconData ico, String label, action)
  {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Icon(ico, color: Colors.white),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 8.0)),
          ],
        ),
        onTap: action,
      ),
    );
  }
  
  Widget getMenuBar(BuildContext context)
  {
    // final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: this.getButton(context, Icons.calendar_today, 'ADD TO CALENDAR', () => onTapCalendar(context)),),
            Expanded(flex: 1, child: this.getButton(context, Icons.map, 'VIEW ON MAP', () => onTapMap(context)),),
            Expanded(flex: 1, child: this.getButton(context, Icons.share, 'SHARE', () => onTapShare(context)),),
            Expanded(flex: 1, child: this.getButton(context, Icons.favorite, 'FAVORITE', () => onTapFavorite(context)),),
          ],
      ),
      ));
  }

  Widget getTitle(String txt)
  {
    return Container(
        padding: const EdgeInsets.all(13.0),
        child: Text(txt, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
    );
  }

  Widget getContent(BuildContext context)
  {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
      // width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.white, ),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      color: Themedata.white,
      child: Column(
        children: <Widget>[
          this.getTitle('DATE / TIME'),
          Text(FormaterElem.getDateFormated(game.dateTime, true).replaceAll("\n", " ") ),
          Text(game.status),
          this.getTitle('ARENA'),
          Text(game.arena.name),
          Text(game.arena.address),
          this.getTitle('LEAGUE'),
          Text(game.leagueShortName),
          this.getTitle('SEASON'),
          Text(game.seasonName),
          this.getTitle('DIVISION'),
          Text(game.divisionName),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(_title),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Themedata.greyBackground,
        body: Container(          
          child: Column(
          children: <Widget>[
            this.getTopBar(context),
            this.getMenuBar(context),
            this.getContent(context),
          ],
        )));
  }
}
