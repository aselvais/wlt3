import 'package:flutter/foundation.dart';

class BottombarModel extends ChangeNotifier {
  int _idx = 2;

  ///
  ///
  ///
  int get idx {
    return _idx;
  }

  ///
  ///
  ///
  set idx(v) {
    _idx = v;
    notifyListeners();
  }
}
