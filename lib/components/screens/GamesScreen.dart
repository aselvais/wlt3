import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListGames.dart';
import 'package:wlt3/components/widgets/Buttonlist.dart';
import 'package:wlt3/components/widgets/Calendarbutton.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class GamesScreen extends LoadingStatusWidget {
  ///
  ///
  ///
  onTapSeasons(BuildContext context) {
    Navigator.pushNamed(context, '/seasons');
  }

  ///
  ///
  ///
  onTapDivisions(BuildContext context) {
    Navigator.pushNamed(context, '/divisions');
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final Season season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division division = Provider.of<DivisionsModel>(context).selectedModel;

    try {
    if (this.isLoading(context) == true) {
      return this.getLoadingWidget(context);
    } else return Scaffold(
          backgroundColor: Themedata.greyBackground,
          body: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: Buttonlist(
                            title: 'Season', subtitle: season?.name ?? ''),
                            onTap: () => onTapSeasons(context),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Buttonlist(
                            title: 'Division', subtitle: division?.name ?? ''),
                            onTap: () => onTapDivisions(context),
                      ),
                    )
                  ],
                ),
              ),
              Calendarbutton(),
              Expanded(
                flex: 9,
                child: ListGames(),
              ),
            ],
          ));
    } catch (e) {
      return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Text('Games', style: TextStyle(fontSize: 30, color: Colors.black), ),
        ),
      );
    }
  }
}
