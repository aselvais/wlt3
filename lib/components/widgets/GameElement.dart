import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class GameElement extends StatelessWidget {
  final Game game;

  GameElement({Key key, @required this.game}) : super(key: key);

  Widget getButton(BuildContext context) {
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
