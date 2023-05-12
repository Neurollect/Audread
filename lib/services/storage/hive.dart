// ignore_for_file: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:audread/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  init() async {
    // Initialize hive
    await Hive.initFlutter();

    // Register Hive Adapter
    Hive.registerAdapter(UserModelAdapter());

    final directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);

    // Open the memberBox
    await BoxCollection.open(
      'audreadb',
      {'user_box', 'member_box'},
      path: directory.path,
    );
  }
}
