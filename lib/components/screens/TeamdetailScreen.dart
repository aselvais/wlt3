import 'package:flutter/material.dart';

class TeamdetailScreen extends StatelessWidget
{
  final String _title = 'Teamdetail Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text('Team detail'),
          backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(child: Text(
            _title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white
              ),
          ),
        ),
    );
  }
  
}
