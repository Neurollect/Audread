//lesson_dialog.dart

import 'package:flutter/material.dart';

class LessonAlertDialog extends StatefulWidget {
  const LessonAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  LessonAlertDialogState createState() => LessonAlertDialogState();
}

class LessonAlertDialogState extends State<LessonAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          const Text(
            'Fetch Error!',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text('Could not Fetch Lesson'),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
