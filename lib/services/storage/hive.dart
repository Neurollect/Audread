// ignore_for_file: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/academic_level.dart';
import '../../models/genre.dart';
import '../../models/grade.dart';
import '../../models/lesson.dart';
import '../../models/member.dart';
import '../../models/subject.dart';
import '../../models/subtopic.dart';
import '../../models/topic.dart';
import '../../models/user.dart';

class HiveStorage {
  init() async {
    // Initialize hive
    await Hive.initFlutter();

    // Register Hive Adapter
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MemberModelAdapter());
    Hive.registerAdapter(AcademicLevelModelAdapter());
    Hive.registerAdapter(GenreModelAdapter());
    Hive.registerAdapter(GradeModelAdapter());
    Hive.registerAdapter(SubjectModelAdapter());
    Hive.registerAdapter(TopicModelAdapter());
    Hive.registerAdapter(SubtopicModelAdapter());
    Hive.registerAdapter(LessonModelAdapter());

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
