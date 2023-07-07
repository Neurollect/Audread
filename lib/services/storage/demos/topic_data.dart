import 'package:audread/models/grade.dart';
import 'package:audread/models/topic.dart';

class TopicsDemoData {
  final List<TopicModel> randomTopics = [
    TopicModel(
      topicId: '1',
      topicName: 'Structure and Bonding',
      topicDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, somthin somone',
      topicGrade: GradeModel(gradeId: '1', gradeName: 'Form One'),
    ),
    TopicModel(
      topicId: '2',
      topicName: 'Carbon and its compounds',
      topicDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, somthin somone',
      topicGrade: GradeModel(gradeId: '1', gradeName: 'Form One'),
    ),
    TopicModel(
      topicId: '3',
      topicName: 'Water and Hydrogen',
      topicDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, somthin somone',
      topicGrade: GradeModel(gradeId: '2', gradeName: 'Form Two'),
    ),
    TopicModel(
      topicId: '4',
      topicName: 'Chlorine and its compounds',
      topicDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, somthin somone',
      topicGrade: GradeModel(gradeId: '2', gradeName: 'Form Two'),
    ),
  ];
}
