import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/screens/DivisionsScreen.dart';
import 'package:wlt3/components/screens/FeedbackScreen.dart';
import 'package:wlt3/components/screens/GamedetailScreen.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';
import 'package:wlt3/components/screens/LoginScreen.dart';
import 'package:wlt3/components/screens/PickDateScreen.dart';
import 'package:wlt3/components/screens/ProfileScreen.dart';
import 'package:wlt3/components/screens/SeasonsScreen.dart';
import 'package:wlt3/components/screens/TeamdetailScreen.dart';
import 'package:wlt3/components/screens/TiersScreen.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class RouterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<LeaguesModel>(builder: (context) => LeaguesModel()),
          ChangeNotifierProvider<SeasonsModel>(builder: (context) => SeasonsModel()),
          ChangeNotifierProvider<DivisionsModel>(builder: (context) => DivisionsModel()),
          ChangeNotifierProvider<GamesModel>(builder: (context) => GamesModel()),
          ChangeNotifierProvider<TiersModel>(builder: (context) => TiersModel()),
          ChangeNotifierProvider<StandingsModel>(builder: (context) => StandingsModel()),
          ChangeNotifierProvider<BottombarModel>(builder: (context) => BottombarModel()),
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
          '/pickdate': (context) => new PickDateScreen(),
          '/teamdetail': (context) => new TeamdetailScreen(),
        }
      )
    );
    
  }


}
