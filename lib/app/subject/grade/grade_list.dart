import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class GradeList extends StatelessWidget {
  const GradeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List grades = [
      ['Form One', 'Study form one notes', Colors.blue.shade50],
      ['Form Two', 'Study form two notes', Colors.green.shade50],
      ['Form Three', 'Study form three notes', Colors.orange.shade50],
      ['Form Four', 'Study form four notes', Colors.red.shade50]
    ];
    return Column(
      children: [
        for (var grade in grades) ...[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: grade[2],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Image(
                  width: 60,
                  image: AssetImage(
                    'assets/images/subjects/chemistry/teacher_stucture_bonding.png',
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      grade[0],
                      style: GoogleFonts.urbanist(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      grade[1],
                      style: GoogleFonts.urbanist(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.width / 8 * 0.9,
                  width: MediaQuery.of(context).size.width / 8 * 0.9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade50,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Icon(
                      Iconsax.play,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ],
    );
  }
}
