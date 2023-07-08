import 'dart:math';

import 'package:audread/models/grade.dart';
import 'package:audread/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../subject/topic/topic_prov.dart';

class TopicContainer extends StatelessWidget {
  const TopicContainer({Key? key, required this.grade, required this.topic})
      : super(key: key);
  final TopicModel topic;
  final GradeModel grade;

  Color getRandomColor() {
    List<Color> colors = [
      Colors.blueAccent.shade400,
      Colors.redAccent.shade400,
      Colors.greenAccent.shade400,
      Colors.yellowAccent.shade400,
      Colors.pinkAccent.shade400,
      Colors.orangeAccent.shade400,
      Colors.purpleAccent.shade400,
    ];
    return colors[Random().nextInt(6)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.6,
      height: 152,
      decoration: BoxDecoration(
        color: getRandomColor(),
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/subjects/physics/physics.png'),
          alignment: Alignment.centerRight,
          opacity: 0.4,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            grade.gradeName.toString(),
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
                  topic.topicName.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
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
                  Get.to(const TopicProv(
                    topicId: 'Bonding10',
                  ));
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
    );
  }
}
