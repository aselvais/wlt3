import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget
{
  final String _title = 'Favorites Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
