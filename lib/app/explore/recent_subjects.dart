import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../subject/grade/subject.dart';

class RecentSubjects extends StatefulWidget {
  const RecentSubjects({Key? key}) : super(key: key);

  @override
  RecentSubjectsState createState() => RecentSubjectsState();
}

class RecentSubjectsState extends State<RecentSubjects> {
  List recentCourses = [
    [
      'Biology',
      'Transport in Living Organisms',
      Colors.orangeAccent.shade700,
      'assets/images/subjects/biology/circulatory_system.png'
    ],
    [
      'Physics',
      'Turning Effect of a Force',
      Colors.blueAccent.shade700,
      'assets/images/subjects/physics/teoff.png'
    ],
    [
      'Chemistry',
      'Structure and Bonding',
      Colors.yellowAccent.shade700,
      'assets/images/subjects/chemistry/teacher_stucture_bonding.png'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //For You Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Subjects',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            TextButton(
              onPressed: () {
                Get.to(const SubjectView(
                  subjectId: '20',
                ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const CircleBorder(),
              ),
              child: Text(
                '-See All',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i in recentCourses) ...[
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: i[2],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(i[3]),
                      alignment: Alignment.centerRight,
                      opacity: 0.6,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i[0],
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              i[1],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.urbanist(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '20 Min',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Iconsax.play),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animate().fade(
                      duration: const Duration(
                        milliseconds: 1000,
                      ),
                    ),
                const SizedBox(width: 20),
              ],
            ],
          ),
        )
      ],
    );
  }
}
