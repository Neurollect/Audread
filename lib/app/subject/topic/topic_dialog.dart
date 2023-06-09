import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicDialog extends StatefulWidget {
  const TopicDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.callBack,
  }) : super(key: key);

  final String title, description;
  final dynamic callBack;

  @override
  TopicDialogState createState() => TopicDialogState();
}

class TopicDialogState extends State<TopicDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      widget.callBack!();
                    },
                    child: Center(
                      child: Text(
                        "Try Again?",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 2,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Center(
                      child: Text(
                        "Go Back",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
