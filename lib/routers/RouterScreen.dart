import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/screens/DivisionsScreen.dart';
import 'package:wlt3/components/screens/FeedbackScreen.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';
import 'package:wlt3/components/screens/LoginScreen.dart';
import 'package:wlt3/components/screens/ProfileScreen.dart';
import 'package:wlt3/components/screens/SeasonsScreen.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';

class RouterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<LeaguesModel>(builder: (context) => LeaguesModel()),
          ChangeNotifierProvider<SeasonsModel>(builder: (context) => SeasonsModel()),
          ChangeNotifierProvider<DivisionsModel>(builder: (context) => DivisionsModel()),
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
          '/feedback': (context) => new FeedbackScreen(),
          '/profile': (context) => new ProfileScreen(),
        }
      )
    );
    
  }


}
