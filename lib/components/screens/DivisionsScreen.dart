import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListDivisions.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class DivisionsScreen extends LoadingStatusWidget {
  final String _title = 'Divisions';
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
        backgroundColor: Colors.white,
        body: ListDivisions());
  }
}
