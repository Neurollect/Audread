import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../subject/grade/subject.dart';

class SubjectTopics extends StatefulWidget {
  const SubjectTopics({Key? key}) : super(key: key);

  @override
  SubjectTopicsState createState() => SubjectTopicsState();
}

class SubjectTopicsState extends State<SubjectTopics> {
  List topics = [
    [
      'Physics',
      [
        [
          'Form 2',
          'Equilibrium and Center Gravity',
          Colors.redAccent.shade700,
          'assets/images/subjects/physics/physics.png'
        ],
        [
          'Form 3',
          'Newtons Laws of Motion',
          Colors.greenAccent.shade700,
          'assets/images/subjects/physics/teoff.png'
        ],
        [
          'Form 2',
          'Fluid flow and Bernoulis',
          Colors.pinkAccent.shade700,
          'assets/images/subjects/physics/fluid_flow.png'
        ],
      ]
    ],
    [
      'Chemistry',
      [
        [
          'Form 2',
          'Structure and Bonding',
          Colors.purpleAccent.shade700,
          'assets/images/subjects/chemistry/teacher_stucture_bonding.png'
        ],
        [
          'Form 1',
          'Hydrogen and Water',
          Colors.blueAccent.shade700,
          'assets/images/subjects/chemistry/lab_equipments.png'
        ],
        [
          'Form 4',
          'Organic Chemistry II',
          Colors.orangeAccent.shade700,
          'assets/images/subjects/chemistry/organic_chemistry.png'
        ],
      ]
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //For You Section

        for (var i in topics) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                i[0],
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const SubjectView());
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
            ].animate().fade(
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var a in i[1]) ...[
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 162,
                    decoration: BoxDecoration(
                      color: a[2],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(a[3]),
                        alignment: Alignment.centerRight,
                        opacity: 0.4,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          a[0],
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          a[1],
                          style: GoogleFonts.urbanist(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '20 Min',
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                  ),
                  const SizedBox(width: 20),
                ],
              ].animate().fade(
                    duration: const Duration(
                      milliseconds: 1000,
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}
