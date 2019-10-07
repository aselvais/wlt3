import 'package:flutter/material.dart';

class ListAbstract extends StatelessWidget
{
  @override
  ListView build(BuildContext context) {
    return ListView(
        children: List.generate(96, (index) {
            if (index == 0)
              return Image.network('http://www.winloseortie.com/wp-content/themes/pogon/images/WLT-Logo.jpg');
            else
              return Center(child: Text('> Item #$index <',style: Theme.of(context).textTheme.headline,));
        }),
    );
  }
  
}
