import 'package:audread/configs/themes/loading_theme.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final loadingTheme = CardLoadingAudTheme();
var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class SubjectLoading extends StatelessWidget {
  SubjectLoading({Key? key}) : super(key: key);

  final cardLoadingTheme = !isDarkMode
      ? CardLoadingAudTheme.lightTheme
      : CardLoadingAudTheme.darkTheme;

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
        for (var i = 1; i < 4; i++) ...[
          loadingCard(25),
        ],
        loadingCard(25, MediaQuery.of(context).size.width * 0.5),
        for (var i = 1; i < 4; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              loadingCard(25, MediaQuery.of(context).size.width * 0.6),
              loadingCard(25, MediaQuery.of(context).size.width * 0.2),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 1; i < 4; i++) ...[
                  loadingCard(162, MediaQuery.of(context).size.width * 0.6),
                  const SizedBox(width: 10),
                ],
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
