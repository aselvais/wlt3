import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Topmenubar extends StatelessWidget with PreferredSizeWidget {

  @override
  AppBar build(BuildContext context) {
    return new AppBar(
      title : new Text( 'Win Lose or Tie' ),
      backgroundColor : Themedata.blue
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  
}
