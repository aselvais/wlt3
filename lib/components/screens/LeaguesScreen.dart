import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListLeagues.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class LeaguesScreen extends LoadingStatusWidget {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    if (this.isLoading(context) == true) {
      return this.getLoadingWidget(context);
    } else return Scaffold(backgroundColor: Colors.white, body: ListLeagues());
  }
}
