import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget
{
  final String _title = 'Games Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
