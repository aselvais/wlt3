import 'package:flutter/material.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class ProfileScreen extends LoadingStatusWidget {
  final String _title = 'Profile Screen';
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    if (this.isLoading(context) == true) {
      return this.getLoadingWidget(context);
    } else return Scaffold(
      appBar: AppBar(
        title: new Text(_title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          _title,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
