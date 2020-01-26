import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/TiersModel.dart';

///
///
///
class LoadingStatusWidget extends StatelessWidget {
  ///
  ///
  ///
  bool isLoading(BuildContext context) {
    final _leaguesModel = Provider.of<LeaguesModel>(context);
    final _seasonsModel = Provider.of<SeasonsModel>(context);
    final _divisionsModel = Provider.of<DivisionsModel>(context);
    final _gamesModel = Provider.of<GamesModel>(context);
    final _standingsModel = Provider.of<StandingsModel>(context);
    final _matchdatesModel = Provider.of<MatchdatesModel>(context);
    final _teamModel = Provider.of<TeamModel>(context);
    final _tiersModel = Provider.of<TiersModel>(context);
    if (_leaguesModel.loading == true ||
        _seasonsModel.loading == true ||
        _divisionsModel.loading == true ||
        _gamesModel.loading == true ||
        _standingsModel.loading == true ||
        _matchdatesModel.loading == true ||
        _teamModel.loading == true ||
        _tiersModel.loading == true)
      return true;
    else
      return false;
  }

  ///
  ///
  ///
  Widget getLoadingWidget(BuildContext context) {    
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()));
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
