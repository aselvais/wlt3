import 'package:flutter/material.dart';

class TeamdetailScreen extends StatelessWidget
{
  final String _title = 'Teamdetail Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: new Text('Team detail'),
          backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Container(child: Text('top', style: TextStyle(color: Colors.white)),),
            )
          ,),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            )
          ,),
          Expanded(
            flex: 7,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Text(
                    _title,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                      ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
  
}
