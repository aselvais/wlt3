import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListAbstract.dart';

class LeaguesScreen extends StatelessWidget
{
  final String _title = 'Leagues Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListAbstract()
    );
  }
  
}
