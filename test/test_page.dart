import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:lu_foundation/foundation.dart';

/// @author luwenjie on 2023/10/5 14:30:49

class TestPage extends LuPage {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TestPageState();
  }
}

class TestPageState extends LuPageState<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
