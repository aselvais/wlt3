import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Bottomnavigationwlt extends StatelessWidget
{

  void onItemTapped(context, int index) {
    // Games
    if (index == 0) {
      Navigator.pushNamed(context, '/games');
    }
    // Standing
    if (index == 1) {
      Navigator.pushNamed(context, '/standing');
    }
    // Leagues
    if (index == 2) {
      Navigator.pushNamed(context, '/leagues');
    }
    // Favorite
    if (index == 3) {
      Navigator.pushNamed(context, '/favorites');
    }
    
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    return new BottomNavigationBar(
      selectedItemColor: Themedata.selectedItemColor,
      unselectedItemColor: Themedata.unselectedItemColor,
      //currentIndex: _selectedIndex,
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