import 'package:audread/app/subject/grade/grade_displays.dart';
import 'package:audread/app/subject/grade/subject_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../models/subject.dart';
import '../../../models/topic.dart';
import '../topic/topic_dialog.dart';

enum SjState {
  loading,
  loaded,
  fetchError,
}

class SubjectView extends StatefulWidget {
  const SubjectView({Key? key, required this.subjectId}) : super(key: key);
  final String subjectId;

  @override
  SubjectViewState createState() => SubjectViewState();
}

class SubjectViewState extends State<SubjectView> {
  SubjectModel subject = SubjectModel(id: 'id');
  List<TopicModel> topics = [];
  SjState sjState = SjState.loading;

  Future getSubject() async {
    try {
      final subjectBox = await Hive.openBox<SubjectModel>('subject');
      setState(() {
        subject = subjectBox.get(widget.subjectId)!;
        sjState = SjState.loaded;
      });
    } catch (e) {
      setState(() {
        sjState = SjState.fetchError;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSubject();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sjState == SjState.loading ||
                  sjState == SjState.fetchError) ...[
                SubjectLoading(),
                if (sjState == SjState.fetchError) ...[
                  //displayDialog(getTopics())
                ],
              ] else ...[
                const SizedBox(height: 10),
                Text(
                  subject.name.toString(),
                  style: GoogleFonts.urbanist(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'by Veritasium',
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/stock/cs.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'About Subject',
                  style: GoogleFonts.urbanist(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'We dont really know what Shakespeare looked like, Someone else wrote the Shakespeare play..',
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const GradeDisplay(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  displayDialog(anyFunction) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        showDialog(
          barrierColor: const Color.fromARGB(5, 71, 71, 71),
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return TopicDialog(
              title: 'Error 3022',
              description: 'Could not get Subject',
              callBack: anyFunction,
            );
          },
        );
      });
    });
  }
}
