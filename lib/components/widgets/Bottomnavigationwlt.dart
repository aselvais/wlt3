import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/CartModel.dart';

class Bottomnavigationwlt extends StatelessWidget
{

  void onItemTapped(context, int index) {
    var cart = Provider.of<CartModel>(context);
    cart.idx = index;
    /*
    // Games
    if (index == 0) {
      //Navigator.pushNamed(context, '/games');
    }
    // Standing
    if (index == 1) {
      //Navigator.pushNamed(context, '/standing');
    }
    // Leagues
    if (index == 2) {
      //Navigator.pushNamed(context, '/leagues');
    }
    // Favorite
    if (index == 3) {
      //Navigator.pushNamed(context, '/favorites');
    }
    */
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

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