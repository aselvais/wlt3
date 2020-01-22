import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/screens/DivisionsScreen.dart';
import 'package:wlt3/components/screens/FeedbackScreen.dart';
import 'package:wlt3/components/screens/GamedetailScreen.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';
import 'package:wlt3/components/screens/LoginScreen.dart';
import 'package:wlt3/components/screens/ProfileScreen.dart';
import 'package:wlt3/components/screens/SeasonsScreen.dart';
import 'package:wlt3/components/screens/TeamdetailScreen.dart';
import 'package:wlt3/components/screens/TiersScreen.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class RouterScreen extends StatelessWidget {

  FavoritesModel _favoritesModel = FavoritesModel();
  LeaguesModel _leaguesModel = LeaguesModel();
  SeasonsModel _seasonsModel = SeasonsModel();
  DivisionsModel _divisionsModel = DivisionsModel();
  TiersModel _tiersModel = TiersModel();

  _preProcessSelection()
  {
    _favoritesModel.read();
    // Leagues pre-selection
    _leaguesModel.selectedModel = _favoritesModel?.lastSelectedLeague ?? null;
    _leaguesModel.selectedId = _favoritesModel?.lastSelectedLeague?.id ?? -1;
    // Season
    _seasonsModel.selectedModel = _favoritesModel?.lastSelectedSeason ?? null;
    _seasonsModel.selectedId = _favoritesModel?.lastSelectedSeason?.id ?? -1;
    // Division
    _divisionsModel.selectedModel = _favoritesModel?.lastSelectedDivision ?? null;
    _divisionsModel.selectedId = _favoritesModel?.lastSelectedDivision?.id ?? -1;
  }

  @override
  Widget build(BuildContext context) {

    this._preProcessSelection();
    
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<FavoritesModel>(create: (context) => _favoritesModel),
          ChangeNotifierProvider<LeaguesModel>(create: (context) => _leaguesModel),
          ChangeNotifierProvider<SeasonsModel>(create: (context) => _seasonsModel),
          ChangeNotifierProvider<DivisionsModel>(create: (context) => _divisionsModel),
          ChangeNotifierProvider<TiersModel>(create: (context) => _tiersModel),
          ChangeNotifierProvider<GamesModel>(create: (context) => GamesModel()),
          ChangeNotifierProvider<StandingsModel>(create: (context) => StandingsModel()),
          ChangeNotifierProvider<TeamModel>(create: (context) => TeamModel()),
          ChangeNotifierProvider<BottombarModel>(create: (context) => BottombarModel()),
          ChangeNotifierProvider<MatchdatesModel>(create: (context) => MatchdatesModel()),
      ],
      child: MaterialApp(
        title: 'Win Lose or Tie',
        theme: new ThemeData( 
          brightness: Brightness.light, 
          backgroundColor: Themedata.white, 
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => new LoginScreen(),
          '/home': (context) => new HomeScreen(),
          '/seasons': (context) => SeasonsScreen(),
          '/divisions': (context) => DivisionsScreen(),
          '/tiers': (context) => TiersScreen(),
          '/feedback': (context) => new FeedbackScreen(),
          '/profile': (context) => new ProfileScreen(),
          '/gamedetail': (context) => new GamedetailScreen(),
          '/teamdetail': (context) => new TeamdetailScreen(),
        }
      )
    );
    
  }


}
