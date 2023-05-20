import 'package:audread/app/subject/_topics.dart';
import 'package:audread/app/widgets/subject_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleGradeView extends StatefulWidget {
  const SingleGradeView({Key? key}) : super(key: key);

  @override
  SingleGradeViewState createState() => SingleGradeViewState();
}

class SingleGradeViewState extends State<SingleGradeView> {
  final gradeTopics = GradeTopics().topics[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const SubjectViewHeader(
          title: 'Physics',
        ),
        leadingWidth: double.infinity,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Form One Topics',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10),
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
                      const Expanded(flex: 2, child: SizedBox()),
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
