import 'package:flutter/foundation.dart';

final class AllowContactProvider extends ChangeNotifier {
  bool _isAllowed = false;

  bool get isAllowed => _isAllowed;

  changeAccess(bool isAllowed) async {
    _isAllowed = isAllowed;
    notifyListeners();
  }
}
