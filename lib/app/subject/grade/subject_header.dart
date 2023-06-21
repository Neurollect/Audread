import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/themes/loading_theme.dart';

var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class SubjectHeader extends StatefulWidget {
  final String? subject;
  final String? genre;
  const SubjectHeader({Key? key, required this.subject, required this.genre})
      : super(key: key);

  @override
  SubjectHeaderState createState() => SubjectHeaderState();
}

class SubjectHeaderState extends State<SubjectHeader> {
  final cardLoadingTheme = !isDarkMode
      ? CardLoadingAudTheme.lightTheme
      : CardLoadingAudTheme.darkTheme;

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: side * 0.8,
              width: side * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: side * 0.6,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: side * 0.8,
              width: side * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: side * 0.6,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: side * 0.8,
              width: side * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Icon(
                  Icons.more_vert_outlined,
                  size: side * 0.6,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.subject == null) ...[
                  Expanded(
                    child: CardLoading(
                      height: 30,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      margin: const EdgeInsets.only(top: 12),
                      cardLoadingTheme: cardLoadingTheme,
                    ),
                  ),
                ] else ...[
                  Text(
                    widget.subject.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Science & Technology',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              ],
            ),
          ],
        )
      ],
    );
  }
}
