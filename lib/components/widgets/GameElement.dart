import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class GameElement extends StatelessWidget {
  final Game game;

  GameElement({Key key, @required this.game}) : super(key: key);


  Widget getTeamTitle(String txt, bool isWinner)
  {
    TextStyle stl;
    if (isWinner == true) 
      stl = TextStyle(color: Themedata.blue, fontSize: 14.0, fontWeight: FontWeight.bold);
    else 
      stl = TextStyle(color: Themedata.black, fontSize: 14.0);
    String tt = '';
    List<String> t = txt.toUpperCase().split(" ");
    for (int i=0; i < t.length; i++)
    {
      if (i < t.length-1) tt += t[i] + " "; else tt += "\n" + t[i];
    }
    return Container(padding: EdgeInsets.all(8.0), child: Text(tt, style: stl));
  }

  Widget getBottomInfo(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(8.0), 
      child: Row(children: <Widget>[
            Expanded(flex: 11, child: Column(
              children: <Widget>[
              Text(((game.leagueShortName != null) ? game.leagueShortName.toUpperCase() : ''), style: TextStyle(color: Themedata.blue, fontSize: 12.0, fontWeight: FontWeight.bold)),
              Text(((game.seasonName != null) ? game.seasonName.toUpperCase() : '') + ' | ' +
              ((game.seasonName != null) ? game.divisionName.toUpperCase() : ''), style: TextStyle(color: Themedata.black, fontSize: 12.0)),
            ],)
          ,),
      ],),
    );
  }

  Widget getDateFormated(dtstr) 
  {
    DateTime dt = DateTime.parse(dtstr);
    String fftoday = new DateFormat("EEE MMM d, yyyy", "en_US").format(DateTime.now());
    String ff = new DateFormat("EEE MMM d, yyyy", "en_US").format(dt);
    if (ff == fftoday) ff = "Today";
    String ff2 = new DateFormat.jm().format(dt);
    return Text(ff + "\n" + ff2);
  }

  Widget getTheIcon(String iconName, bool isOn)
  {
    IconData i;
    if (iconName == 'star') {
      return (isOn == true) ? 
              Icon(Icons.star, color: Colors.orange,) :
              Icon(Icons.star_border, color: Colors.grey,);
    }
    if (iconName == 'location') {
      i = Icons.location_on;
      return Icon(i, color: Colors.grey,);
    }
    return Container();
  }

  Widget getScoreTxt(String txt)
  {
    if (txt == 'null') txt = '-';
    return Text(txt, style: TextStyle(color: Themedata.grey, fontSize: 25.0));
  }

  Widget getGameRow(Image img0, String teamName, bool g01, String score, String gamedateTime, String gameinfo, String iconShape, bool iconSelected)
  {
    return Row(children: <Widget>[
      Expanded(flex: 1, child: (img0 == null) ? Container() : img0, ),
      Expanded(flex: 4, child: this.getTeamTitle(teamName, g01),  ),
      Expanded(flex: 2, child: this.getScoreTxt(score)),
      (gamedateTime != null) ? 
              Expanded(flex: 4, child: this.getDateFormated(gamedateTime),) : 
              Expanded(flex: 4, child: Text(gameinfo),),
      Expanded(flex: 1, child: this.getTheIcon(iconShape, iconSelected),),
    ],);
  }

  Widget getButton(BuildContext context) {
    bool g01, g02 = false;
    Image img01, img02;
    try { g01 = (game.info.team1.score > game.info.team2.score); } catch(eee) {}
    try { g02 = (game.info.team1.score <= game.info.team2.score); } catch(eee) {}
    try { img01 = Image.network(game.info.team1.imageUrl, width: 25, height: 25); } catch(eee) {}
    try { img02 = Image.network(game.info.team2.imageUrl, width: 25, height: 25); } catch(eee) {}
    return Column(children: <Widget>[
        this.getGameRow(img01, game.info.team1.teamName, g01, game.info.team1.score.toString(), game.dateTime, null, 'star', false ),
        this.getGameRow(img02, game.info.team2.teamName, g02, game.info.team2.score.toString(), null, game.arena.name + "\n" + game.status.toUpperCase(), 'location', false ),
        (game.seasonName != null) ? this.getBottomInfo(context) : Container(),
    ],);
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
