
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wlt3/models/ItemModel.dart';

class AddButton extends StatelessWidget {

  final ItemModel item;

  const AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => null,
      splashColor: Theme.of(context).primaryColor,
      child: Text('ADD'),
    );
  }

}
