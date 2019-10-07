import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Bottomnavigationwlt extends StatelessWidget
{

  void onItemTapped(context, int index) {
    // Games
    if (index == 0) {
      print('Games');
      //Navigator.pushNamed(context, '/second');
      Navigator.pushNamed(context, '/games');
    }
    // Standing
    if (index == 1) {
      print('Standing');
      Navigator.pushNamed(context, '/standing');
    }
    // Leagues
    if (index == 2) {
      print('Leagues');

    }
    // Favorite
    if (index == 3) {
      print('Favorite');
    }
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    return new BottomNavigationBar(
      selectedItemColor: Themedata.selectedItemColor,
      unselectedItemColor: Themedata.unselectedItemColor,
      onTap: (index) => onItemTapped(context, index),
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