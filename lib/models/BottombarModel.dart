import 'package:flutter/foundation.dart';

class BottombarModel extends ChangeNotifier {
  int _idx = 0;

  int get idx { 
    return _idx;
  }

  set idx(v) {
    _idx = v;
    notifyListeners();
  }

}