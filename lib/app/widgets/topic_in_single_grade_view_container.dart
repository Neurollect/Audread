import 'package:audread/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicInSingleGradeViewContainer extends StatelessWidget {
  const TopicInSingleGradeViewContainer({Key? key, required this.topic})
      : super(key: key);
  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.shade50,
        image: const DecorationImage(
          scale: 0.1,
          image: AssetImage(
              'assets/images/subjects/chemistry/teacher_stucture_bonding.png'),
          alignment: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic.topicName.toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  topic.topicDescription.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.all(6),
                  ),
                  child: Text(
                    'Read More',
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }
}
