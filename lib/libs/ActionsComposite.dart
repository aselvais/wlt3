import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Tiers.dart';
import 'package:wlt3/models/TiersModel.dart';

class ActionsComposite
{
  
  ///
  ///
  ///
  static goToTeamDetailScreen(BuildContext context, int teamId)
  {
    final TeamModel teammodel = Provider.of<TeamModel>(context);
    teammodel.loadData(teamId);
    // load standings for this team
    // @todo Do this only after loading 
    try {
      final standing = Provider.of<StandingsModel>(context);
      standing.loadData(
        teammodel.selectedModel.teaminfo.divisionId, 
        teammodel.selectedModel.teaminfo.tierId
      );
    } catch (ee) {}
    Navigator.pushNamed(context, '/teamdetail');
  }

  ///
  ///
  ///
  static goToGamesHomeScreen(BuildContext context, Division model)
  {
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    final divisions = Provider.of<DivisionsModel>(context);
    final bottomModel = Provider.of<BottombarModel>(context);
    final games = Provider.of<GamesModel>(context);
    final seasons = Provider.of<SeasonsModel>(context);
    divisions.selectedId = model.id;
    divisions.selectedModel = model;
    favorites.lastSelectedDivision = model;
    // loading game dates
    final matchdatesModel = Provider.of<MatchdatesModel>(context);
    matchdatesModel.loadData(seasons.selectedModel.id, divisions.selectedModel.id);
    // loading games
    // games.loadData(seasons.selectedModel.id, divisions.selectedModel.id);
    ActionsComposite.loadClosestGamesToDate(context, true);
    bottomModel.idx = 0;
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  ///
  ///
  ///
  static setGamesDataOnCachedSelection(_favoritesModel, _leaguesModel, _seasonsModel, _divisionsModel, _tiersModel, _matchdatesModel)
  {
    _favoritesModel.read();
    _leaguesModel.loadData();
    // Leagues pre-selection
    _leaguesModel.selectedModel = _favoritesModel?.lastSelectedLeague ?? null;
    _leaguesModel.selectedId = _favoritesModel?.lastSelectedLeague?.id ?? -1;
    // Season
    _seasonsModel.loadData(_leaguesModel.selectedId);
    _seasonsModel.selectedModel = _favoritesModel?.lastSelectedSeason ?? null;
    _seasonsModel.selectedId = _favoritesModel?.lastSelectedSeason?.id ?? -1;
    // Division
    _divisionsModel.loadData(_seasonsModel.selectedId);
    _divisionsModel.selectedModel = _favoritesModel?.lastSelectedDivision ?? null;
    _divisionsModel.selectedId = _favoritesModel?.lastSelectedDivision?.id ?? -1;
    // loading game dates
    _matchdatesModel.loadData(_seasonsModel.selectedModel.id, _divisionsModel.selectedModel.id);

  }


  ///
  ///
  ///
  static goToSeasonScreen(BuildContext context, League item)
  {
    final _list = Provider.of<LeaguesModel>(context);
    final _list2 = Provider.of<SeasonsModel>(context);
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    _list.selectedId = item.id;
    _list.selectedModel = item;
    favorites.lastSelectedLeague = item;
    _list2.loadData(item.id);
    Navigator.pushNamed(context, '/seasons');
  }

  ///
  ///
  ///
  static goToDivisionsScreen(BuildContext context, Season model)
  {
    final _list = Provider.of<SeasonsModel>(context);
    final _list2 = Provider.of<DivisionsModel>(context);
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);

    _list.selectedId = model.id;
    _list.selectedModel = model;
    _list2.loadData(model.id);
    favorites.lastSelectedSeason = model;
    Navigator.pushNamed(context, '/divisions');
  }

  ///
  ///
  ///
  static tiersToStandings(BuildContext context, Tiers model)
  {
    final tiers = Provider.of<TiersModel>(context);
    final bottomModel = Provider.of<BottombarModel>(context);
    tiers.selectedId = model.id;
    tiers.selectedModel = model;
    bottomModel.idx = 1;
    final standing = Provider.of<StandingsModel>(context);
    final divisions = Provider.of<DivisionsModel>(context);
    standing.loadData(divisions.selectedModel.id, tiers.selectedModel.id);
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  ///
  ///
  ///
  static loginToHome(BuildContext context) 
  {
    final _leaguesModel = Provider.of<LeaguesModel>(context);
    final _seasonsModel = Provider.of<SeasonsModel>(context);
    final _divisionsModel = Provider.of<DivisionsModel>(context);
    final _bottombarModel = Provider.of<BottombarModel>(context);
    _leaguesModel.loadData();
    if (_leaguesModel.selectedId > -1 && _seasonsModel.selectedId > -1 && _divisionsModel.selectedId > -1)
    {
      _bottombarModel.idx = 0;
      // ActionsComposite.reloadGamesData(context);
      ActionsComposite.loadClosestGamesToDate(context, true);
    } else {
      _bottombarModel.idx = 2;
    }
    Navigator.pushNamed(context, '/home');
  }

  ///
  ///
  ///
  static goToTiersScreen(BuildContext context)
  {
    final tiers = Provider.of<TiersModel>(context);
    final divisions = Provider.of<DivisionsModel>(context);
    tiers.loadData(divisions.selectedModel.id);
    Navigator.pushNamed(context, '/tiers');
  }

  ///
  ///
  ///
  static onBottomNavItemTapped(context, int index) 
  {
    final cart = Provider.of<BottombarModel>(context);
    cart.idx = index;
    if (index == 1) // Standings
    {
      final standing = Provider.of<StandingsModel>(context);
      final divisions = Provider.of<DivisionsModel>(context);
      final tiers = Provider.of<TiersModel>(context);
      tiers.loadData(divisions.selectedModel.id);
      int tiersId = 0;
      try {
        tiersId = tiers.selectedModel.id;
      } catch(eee){}
      try {
        standing.loadData(divisions.selectedModel.id, tiersId);
      } catch(eee){}
    }
    if (index == 2) // Leagues
    {
      final leagues = Provider.of<LeaguesModel>(context);
      leagues.loadData();
    }
  }

  ///
  ///
  ///
  static reloadGamesData(BuildContext context)
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final Season season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division division = Provider.of<DivisionsModel>(context).selectedModel;
    games.loadData(season.id, division.id);
  }

  ///
  /// Load the games (in games screen) to the closest available date
  ///
  static loadClosestGamesToDate(BuildContext context, bool right)
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final matchdatesModel = Provider.of<MatchdatesModel>(context);
    games.selectedDate = matchdatesModel.getClosestDate(games.selectedDate, right, false);
    ActionsComposite.reloadGamesData(context);
  }
  

}