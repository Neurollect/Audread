import 'package:audread/app/subject/grade/single_grade_view.dart';
import 'package:audread/app/subject/topic/topic_prov.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class GradeDisplay extends StatefulWidget {
  const GradeDisplay({Key? key}) : super(key: key);

  @override
  GradeDisplayState createState() => GradeDisplayState();
}

class GradeDisplayState extends State<GradeDisplay> {
  List topics = [
    [
      'Form One',
      [
        [
          'Form 1',
          'Equilibrium and Center Gravity',
          Colors.redAccent.shade700,
          'assets/images/subjects/physics/physics.png'
        ],
        [
          'Form 1',
          'Newtons Laws of Motion',
          Colors.greenAccent.shade700,
          'assets/images/subjects/physics/teoff.png'
        ],
        [
          'Form 1',
          'Fluid flow and Bernoulis',
          Colors.pinkAccent.shade700,
          'assets/images/subjects/physics/fluid_flow.png'
        ],
      ]
    ],
    [
      'Form Two',
      [
        [
          'Form 2',
          'Structure and Bonding',
          Colors.purpleAccent.shade700,
          'assets/images/subjects/chemistry/teacher_stucture_bonding.png'
        ],
        [
          'Form 2',
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
    ],
    [
      'Form Three',
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
    ],
    [
      'Form Four',
      [
        [
          'Form 4',
          'Structure and Bonding',
          Colors.purpleAccent.shade700,
          'assets/images/subjects/chemistry/teacher_stucture_bonding.png'
        ],
        [
          'Form 4',
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
                  Get.to(const SingleGradeView());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const CircleBorder(),
                ),
                child: Text(
                  '- See All',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                a[1],
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(const TopicProv());
                              },
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
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
