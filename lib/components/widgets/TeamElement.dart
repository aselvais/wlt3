import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Team.dart';

///
///
///
class TeamElement extends StatelessWidget {
  final Team team;

  ///
  ///
  ///
  TeamElement({Key key, @required this.team}) : super(key: key);

  ///
  ///
  ///
  onTapElement(BuildContext context) {
    ActionsComposite.goToTeamDetailScreen(context, team.teamId);
  }

  ///
  ///
  ///
  Widget getButton(BuildContext context) {
    Image img01;
    try {
      img01 = Image.network(team.imageUrl, width: 30, height: 30);
    } catch (eee) {}
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: img01,
        ),
        Expanded(
          flex: 8,
          child: Column(children: [
            Text(team.teamName),
            Text(team.divisionName),
          ]),
        )
      ],
    );
  }

  ///
  ///
  ///
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
