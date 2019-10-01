import 'package:flutter/material.dart';

class ListAbstract extends StatelessWidget
{

  @override
  ListView build(BuildContext context) {
    return ListView(
          children: List.generate(1001, (index) {
            return Center(
              child: Text(
                'My great item #$index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
    );
  }
}