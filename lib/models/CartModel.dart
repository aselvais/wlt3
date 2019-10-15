import 'package:flutter/foundation.dart';
import 'package:wlt3/models/CatalogModel.dart';
import 'package:wlt3/models/ItemModel.dart';

class CartModel extends ChangeNotifier {

  final CatalogModel _catalog;
  final List<int> _itemIds;
  int _idx = 0;

  CartModel(this._catalog, CartModel previous) : assert(_catalog != null), _itemIds = previous?._itemIds ?? [];

  List<ItemModel> get items { 
    return _itemIds.map((id) => _catalog.getById(id)).toList(); 
  }

  int get totalPrice { 
    return items.fold(0, (total, current) => total + current.price); 
  }

  int get idx { 
    return _idx;
  }

  set idx(v) {
    _idx = v;
    notifyListeners();
  }

  void add(ItemModel item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

}