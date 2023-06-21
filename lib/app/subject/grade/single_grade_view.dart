import 'package:audread/app/subject/grade/subject_header.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

final utils = Utils();

class SingleGradeView extends StatefulWidget {
  const SingleGradeView({Key? key}) : super(key: key);

  @override
  SingleGradeViewState createState() => SingleGradeViewState();
}

class SingleGradeViewState extends State<SingleGradeView> {
  final gradeTopics = [
    [],
    [
      [
        'Form 3',
        'Structure and Bonding',
        Colors.purpleAccent.shade700,
        'assets/images/subjects/chemistry/teacher_stucture_bonding.png'
      ],
      [
        'Form 3',
        'Hydrogen and Water',
        Colors.blueAccent.shade700,
        'assets/images/subjects/chemistry/lab_equipments.png'
      ],
      [
        'Form 3',
        'Organic Chemistry II',
        Colors.orangeAccent.shade700,
        'assets/images/subjects/chemistry/organic_chemistry.png'
      ],
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubjectHeader(subject: 'Chemistry Form One', genre: ''),
              const SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration:
                    utils.inputFields.topicSearchButtonDecoration(context),
              ),
              const SizedBox(height: 20),
              for (var a in gradeTopics[1]) ...[
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.shade50,
                    image: DecorationImage(
                      scale: 0.1,
                      image: AssetImage(a[3]),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              a[1],
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'We dont really know what Shakespeare looked like, Someone else wrote the Shakespeare play..',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                padding: const EdgeInsets.all(6),
                              ),
                              child: Text(
                                'Read More',
                                style: GoogleFonts.urbanist(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ].animate().fade(
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
