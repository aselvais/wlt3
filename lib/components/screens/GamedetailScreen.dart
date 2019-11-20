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

  onTapTeam(BuildContext context, Team team) {
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

  Widget getTopBar(BuildContext context) {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
        //margin: const EdgeInsets.all(5.0),
        height: 200,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(10.0),
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded( flex: 5, child: this.getTeam(context, game.info.team1)),
                Expanded(
                    flex: 1,
                    child: Column(children: <Widget>[
                      Text( 'vs.', style: TextStyle(color: Colors.white))
                      ],),
                    ),
                Expanded( flex: 5, child: this.getTeam(context, game.info.team2)),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                game.leagueName.toUpperCase() + " | " + game.divisionName.toUpperCase(), 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ));
  }

  Widget getTeam(BuildContext context, gameinfoteam)
  {
    return InkWell(
          onTap: () => onTapTeam(context, gameinfoteam),
          child: Column(
            children: <Widget>[
              Image.network(gameinfoteam.imageUrl, width: 80, height: 80),
              Text(gameinfoteam.teamName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Text(gameinfoteam.score.toString(), style: TextStyle(color: Colors.white, fontSize: 34)),
            ],
          ),
        );
  }

  Widget getButton(BuildContext context, IconData ico, String label, action) {
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

  Widget getMenuBar(BuildContext context) {
    // final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: this.getButton(context, Icons.calendar_today,
                    'ADD TO CALENDAR', () => onTapCalendar(context)),
              ),
              Expanded(
                flex: 1,
                child: this.getButton(context, Icons.location_on, 'VIEW ON MAP',
                    () => onTapMap(context)),
              ),
              Expanded(
                flex: 1,
                child: this.getButton(
                    context, Icons.share, 'SHARE', () => onTapShare(context)),
              ),
              Expanded(
                flex: 1,
                child: this.getButton(context, Icons.star_border, 'FAVORITE',
                    () => onTapFavorite(context)),
              ),
            ],
          ),
        ));
  }

  Widget getTitle(String txt) {
    return Container(
        padding: const EdgeInsets.all(13.0),
        child: Text(txt,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)));
  }

  getContentData(BuildContext context)
  {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return <Widget>[
          this.getTitle('DATE / TIME'),
          Text(FormaterElem.getDateFormated(game.dateTime, true)
              .replaceAll("\n", " ")),
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
        ];
  }

  Widget getContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.all( Radius.circular(8.0)), color: Colors.white, ),
      margin: const EdgeInsets.all(25.0),
      padding: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      child: Column( children: this.getContentData(context) ),
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
