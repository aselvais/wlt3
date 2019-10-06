import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class ColorList extends StatelessWidget {
  @override
  ListView build(BuildContext context) {
    Map<String, Color> mycolors = Themedata.getAllColors();
    List<Widget> kids = [];
    mycolors.forEach((final String key, final Color value) {
      kids.add(DecoratedBox(
          decoration: BoxDecoration(color: value),
          child: Center(child: Text(key, style: TextStyle( height: 2, letterSpacing: 2, color: Themedata.white)))
        ));
      kids.add(DecoratedBox(
          decoration: BoxDecoration(color: value),
          child: Center(child: Text(key, style: TextStyle( height: 2, letterSpacing: 2, color: Themedata.black)))
        ));
    });
    return ListView(children: kids);
  }
}
