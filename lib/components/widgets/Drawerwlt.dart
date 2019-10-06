import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Drawerwlt extends StatelessWidget
{
  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('WLT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Themedata.selectedItemColor,
                fontSize: 30,
              )
            ),
            decoration: BoxDecoration(color: Themedata.blue),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

}
