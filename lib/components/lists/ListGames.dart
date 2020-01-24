import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class ListGames extends StatelessWidget {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<GamesModel>(context);
    List<Widget> wl = new List();
    if (_list.loading == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      _list.list.forEach((Game f) => wl.add(GameElement(game: f)));
      return ListView(
        children: wl,
      );
    }
  }
}
