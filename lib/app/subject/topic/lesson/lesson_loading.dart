import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class LessonLoading extends StatelessWidget {
  const LessonLoading({Key? key}) : super(key: key);

  final CardLoadingTheme cardLoadingTheme = const CardLoadingTheme(
    colorOne: Color.fromARGB(255, 240, 240, 240),
    colorTwo: Color.fromARGB(255, 236, 235, 235),
  );

  loadingCard(double height, [width]) {
    return CardLoading(
      height: height,
      width: width,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      cardLoadingTheme: cardLoadingTheme,
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loadingCard(25),
        loadingCard(200),
        for (var i = 1; i < 4; i++) ...[
          loadingCard(25),
        ],
        loadingCard(25, MediaQuery.of(context).size.width * 0.5),
        loadingCard(150),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: loadingCard(150, MediaQuery.of(context).size.width * 0.4),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  for (var i = 1; i < 7; i++) ...[
                    loadingCard(15),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
