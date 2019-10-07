import 'package:flutter/material.dart';
import 'package:wlt3/components/widgets/ListItem.dart';

class MyCatalog extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //_MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListItem(index)),
          ),
        ],
      ),
    );
  }

}
