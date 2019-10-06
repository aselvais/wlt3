import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Bottomnavigationwlt extends StatelessWidget
{
  Color backgroundColor = Themedata.blue;
  Color selectedItemColor = Themedata.selectedItemColor;
  Color unselectedItemColor = Themedata.unselectedItemColor;

  @override
  BottomNavigationBar build(BuildContext context) {
    return new BottomNavigationBar(
      selectedItemColor: this.selectedItemColor,
      unselectedItemColor: this.unselectedItemColor,
      items: [
        new BottomNavigationBarItem(
          backgroundColor: this.backgroundColor,
          icon: const Icon(Icons.date_range),
          title: new Text('Games'),
        ),
        new BottomNavigationBarItem(
          backgroundColor: this.backgroundColor,
          icon: const Icon(Icons.import_contacts),
          title: new Text('Standings'),
        ),
        new BottomNavigationBarItem(
        backgroundColor: this.backgroundColor,
          icon: const Icon(Icons.details),
          title: new Text('Leagues'),
        ),
        new BottomNavigationBarItem(
          backgroundColor: this.backgroundColor,
          icon: const Icon(Icons.star),
          title: new Text('Favorites'),
        )
    ]);
  }

}