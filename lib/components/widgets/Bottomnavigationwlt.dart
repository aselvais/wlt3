import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class Bottomnavigationwlt extends StatelessWidget
{

  void onItemTapped(context, int index) {
    final cart = Provider.of<BottombarModel>(context);
    cart.idx = index;
    if (index == 1) // Standings
    {
      final standing = Provider.of<StandingsModel>(context);
      final divisions = Provider.of<DivisionsModel>(context);
      final tiers = Provider.of<TiersModel>(context);
      int tiersId = 0;
      try{
        tiersId = tiers.selectedModel.id;
      } catch(eee){}
      try{
        standing.loadData(divisions.selectedModel.id, tiersId);
      } catch(eee){}
    }
    if (index == 2) // Leagues
    {
      final leagues = Provider.of<LeaguesModel>(context);
      leagues.loadData();
    }
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    var cart = Provider.of<BottombarModel>(context);

    return new BottomNavigationBar(
      selectedItemColor: Themedata.selectedItemColor,
      unselectedItemColor: Themedata.unselectedItemColor,
      onTap: (index) => onItemTapped(context, index),   
      currentIndex: cart.idx,
      items: [
        new BottomNavigationBarItem(
          backgroundColor: Themedata.blue,
          icon: const Icon(Icons.date_range),
          title: new Text('Games'),
        ),
        new BottomNavigationBarItem(
          backgroundColor: Themedata.blue,
          icon: const Icon(Icons.import_contacts),
          title: new Text('Standings'),
        ),
        new BottomNavigationBarItem(
        backgroundColor: Themedata.blue,
          icon: const Icon(Icons.details),
          title: new Text('Leagues'),
        ),
        new BottomNavigationBarItem(
          backgroundColor: Themedata.blue,
          icon: const Icon(Icons.star),
          title: new Text('Favorites'),
        )
    ]);
  }

}