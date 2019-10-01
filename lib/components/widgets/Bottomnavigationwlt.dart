import 'package:flutter/material.dart';

class Bottomnavigationwlt extends StatelessWidget
{
  Color backgroundColor = Color(0xFF000055);
  Color selectedItemColor = Color(0xFFFFFFFF);
  Color unselectedItemColor = Color(0x55FFFFFF);

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