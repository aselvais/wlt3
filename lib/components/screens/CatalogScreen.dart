import 'package:flutter/material.dart';
import 'package:wlt3/components/widgets/ListItem.dart';

class CatalogScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //_MyAppBar(),
          SliverToBoxAdapter(
            child: 
            FlatButton(
                child: Text('< back',style: TextStyle(fontSize: 40.0),),
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () { Navigator.pop(context); },
          ),
            // SizedBox(height: 12),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListItem(index)),
          ),
        ],
      ),
    );
  }

}
