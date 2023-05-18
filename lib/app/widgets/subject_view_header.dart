import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SubjectViewHeader extends StatefulWidget {
  final String title;
  const SubjectViewHeader({Key? key, required this.title}) : super(key: key);

  @override
  SubjectViewHeaderState createState() => SubjectViewHeaderState();
}

class SubjectViewHeaderState extends State<SubjectViewHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.urbanist(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.fatrows,
                  weight: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.search_normal_1,
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
