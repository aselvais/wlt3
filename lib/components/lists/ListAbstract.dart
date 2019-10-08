import 'package:flutter/material.dart';

class ListAbstract extends StatelessWidget
{
  
  @override
  ListView build(BuildContext context) {
    return ListView(
        children: List.generate(96, (index) {
            return Center(child: Text('> Item #$index <'));
        }),
    );
  }
  
}
