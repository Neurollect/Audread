import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class RecentSubjects extends StatefulWidget {
  const RecentSubjects({Key? key}) : super(key: key);

  @override
  RecentSubjectsState createState() => RecentSubjectsState();
}

class RecentSubjectsState extends State<RecentSubjects> {
  List recentCourses = [
    ['Biology', 'Transport in Living Organisms', Colors.orangeAccent.shade700],
    ['Physics', 'Turning Effect of a Force', Colors.blueAccent.shade700],
    ['Chemistry', 'Structure and Bonding', Colors.yellowAccent.shade700],
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
            Text(
              '-See All',
              style: Theme.of(context).textTheme.labelMedium,
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
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: i[2],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i[0],
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        i[1],
                        style: GoogleFonts.urbanist(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
                              fontWeight: FontWeight.w600,
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
