import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class TopicViewHeader extends StatefulWidget {
  final String title;
  const TopicViewHeader({Key? key, required this.title}) : super(key: key);

  @override
  TopicViewHeaderState createState() => TopicViewHeaderState();
}

class TopicViewHeaderState extends State<TopicViewHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: GoogleFonts.urbanist(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.arrow_right,
                  weight: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.bookmark,
                  weight: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
