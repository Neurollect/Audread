import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class SubtopicsList extends StatefulWidget {
  const SubtopicsList({Key? key, required this.topicId}) : super(key: key);

  final String topicId;

  @override
  SubtopicsListState createState() => SubtopicsListState();
}

class SubtopicsListState extends State<SubtopicsList> {
  bool _searching = false;

  List subtopics = [];

  getSubtopics() async {}

  @override
  void initState() {
    super.initState();
    getSubtopics();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        if (subtopics.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Subtopics',
                  style: GoogleFonts.urbanist(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_searching) ...[
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    decoration: utils.inputFields.topicSearchButtonDecoration(
                      context,
                    ),
                    style: GoogleFonts.urbanist(fontSize: 21),
                  ),
                )
              ] else ...[
                IconButton(
                  onPressed: () => setState(() => _searching = true),
                  icon: const Icon(Iconsax.search_normal_1, weight: 20),
                ),
              ],
            ],
          ),
          for (var st in subtopics) ...[
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
        ],
      ],
    );
  }
}
