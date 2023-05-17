import 'package:audread/app/subject/topic/_topic_info.dart';
import 'package:audread/app/widgets/topic_view_header.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class TopicView extends StatefulWidget {
  const TopicView({Key? key}) : super(key: key);

  @override
  TopicViewState createState() => TopicViewState();
}

class TopicViewState extends State<TopicView> {
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const TopicViewHeader(
          title: 'Introduction to Physics',
        ),
        leadingWidth: double.infinity,
        toolbarHeight: 90,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home/wyltl.png'),
                    alignment: Alignment.centerRight,
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
                            'Continue studying from where you left of?',
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
                              'Continue',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Lessons',
                      style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _searching
                      ? Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            decoration: utils.inputFields
                                .topicSearchButtonDecoration(context),
                            style: GoogleFonts.urbanist(
                              fontSize: 21,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _searching = true;
                            });
                          },
                          icon: const Icon(
                            Iconsax.search_normal_1,
                            weight: 20,
                          ),
                        )
                ],
              ),
              const SizedBox(height: 10),
              for (var st in TopicDetails().topic[0]) ...[
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: st[2],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/subjects/chemistry/lab_equipments.png',
                      ),
                      alignment: Alignment.centerRight,
                      opacity: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              st[0],
                              style: GoogleFonts.urbanist(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              st[1].substring(0, 80),
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                    padding: const EdgeInsets.all(6),
                                  ),
                                  child: Text(
                                    'Read',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                    padding: const EdgeInsets.all(6),
                                  ),
                                  child: Text(
                                    'Quizlet',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next Lesson:',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Measurement I',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
