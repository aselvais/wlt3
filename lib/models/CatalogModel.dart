import 'package:wlt3/models/ItemModel.dart';

class CatalogModel {

  static const _itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  ItemModel getById(int id) => ItemModel(id, _itemNames[id % _itemNames.length]);

  ItemModel getByPosition(int position) {
    return getById(position);
  }

}

