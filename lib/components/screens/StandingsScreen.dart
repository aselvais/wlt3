import 'package:flutter/material.dart';

class StandingsScreen extends StatelessWidget
{
  final String _title = 'Standings Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text(
            _title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black
              ),
          ),
        ),
    );
  }
  
}
