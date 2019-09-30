import 'package:flutter/material.dart';

class Bottomnavigationwlt extends StatelessWidget
{
  @override
  BottomNavigationBar build(BuildContext context) {
    return new BottomNavigationBar(items: [
      new BottomNavigationBarItem(
        icon: const Icon(Icons.date_range),
        title: new Text('Games'),
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.import_contacts),
        title: new Text('Standings'),
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.details),
        title: new Text('Leagues'),
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.star),
        title: new Text('Favorites'),
      )
    ]);
  }

}