import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ColorList.dart';
import 'package:wlt3/components/lists/ListAbstract.dart';
import 'package:wlt3/components/screens/FeedbackScreen.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';
import 'package:wlt3/components/screens/LoginScreen.dart';
import 'package:wlt3/components/screens/MyCatalog.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/CartModel.dart';
import 'package:wlt3/models/CatalogModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class RouterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
          //Provider(builder: (context) => LeaguesModel()),
          Provider(builder: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>( 
            builder: (context, catalog, previousCart) => CartModel(catalog, previousCart) 
          ),
      ],
      child: MaterialApp(
        title: 'Win Lose or Tie',
        theme: new ThemeData( brightness: Brightness.light, backgroundColor: Themedata.white, ),
        initialRoute: '/',
        routes: {
          '/': (context) => new LoginScreen(),
          '/home': (context) => new HomeScreen(),
          '/standing': (context) => new ColorList(),
          '/leagues': (context) => new ListAbstract(),
          '/favorites': (context) => new MyCatalog(),
          '/feedback': (context) => new FeedbackScreen(),
          '/profile': (context) => new FeedbackScreen(),
          '/logout': (context) => new FeedbackScreen(),
        }
      )
    );
    
  }


}
