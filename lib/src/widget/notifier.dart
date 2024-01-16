import 'package:flutter/foundation.dart';

/// @author luwenjie on 2024/1/16 17:27:13

class LuNotifier extends ChangeNotifier {
  final String id;

  LuNotifier({this.id = ""});

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
