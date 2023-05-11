import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  init() async {
    // Initialize hive
    await Hive.initFlutter();
    // Open the peopleBox
    await Hive.openBox('member_box');
  }
}
