import 'package:wlt3/models/ItemModel.dart';

class CatalogModel {

  static const _itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
  ];

  ItemModel getById(int id) { 
    return ItemModel(id, _itemNames[id % _itemNames.length]);
  }

  ItemModel getByPosition(int position) {
    return getById(position);
  }

}

