import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Teamdata.dart';

class TeamElement extends StatelessWidget {
  final Team team;

  TeamElement({Key key, @required this.team}) : super(key: key);

  onTapElement(BuildContext context) {    
    final _list = Provider.of<TeamModel>(context);
    _list.selectedId = team.teamId;
    _list.selectedModel = Teamdata();
    _list.selectedModel.teaminfo = team;
    Navigator.pushNamed(context, '/teamdetail');
  }


  Widget getButton(BuildContext context) {
    Image img01;
    try { img01 = Image.network(team.imageUrl, width: 30, height: 30); } catch(eee) {}
    return Row(children: <Widget>[
      Expanded(
          flex: 2,
          child: img01,
      ),
      Expanded(
        flex: 8,
        child: Column( children: [
          Text(team.teamName),
          Text(team.divisionName ),
        ] )
      ,)
    ],);
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
