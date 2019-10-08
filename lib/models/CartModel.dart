import 'package:flutter/foundation.dart';
import 'package:wlt3/models/CatalogModel.dart';
import 'package:wlt3/models/ItemModel.dart';

class CartModel extends ChangeNotifier {

  final CatalogModel _catalog;
  final List<int> _itemIds;

  CartModel(this._catalog, CartModel previous) : assert(_catalog != null), _itemIds = previous?._itemIds ?? [];

  List<ItemModel> get items { 
    return _itemIds.map((id) => _catalog.getById(id)).toList(); 
  }

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price); 
  }

  void add(ItemModel item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

}