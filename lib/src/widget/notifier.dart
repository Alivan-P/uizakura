import 'package:flutter/foundation.dart';

/// @author luwenjie on 2024/1/16 17:27:13
class UizakuraNotifier<T extends Object> extends ChangeNotifier {
  T? _value;
  final String id;

  UizakuraNotifier({this.id = "", T? value}) {
    this._value = value;
  }

  T? get value => _value;

  // any set will notifyListeners
  set value(T? value) {
    _value = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
