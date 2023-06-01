import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class TopicViewHeader extends StatefulWidget {
  final String? title;
  const TopicViewHeader({Key? key, required this.title}) : super(key: key);

  @override
  TopicViewHeaderState createState() => TopicViewHeaderState();
}

class TopicViewHeaderState extends State<TopicViewHeader> {
  final CardLoadingTheme cardLoadingTheme = const CardLoadingTheme(
    colorOne: Color.fromARGB(255, 240, 240, 240),
    colorTwo: Color.fromARGB(255, 236, 235, 235),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title == null) ...[
            Expanded(
              child: CardLoading(
                height: 30,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                margin: const EdgeInsets.only(top: 12),
                cardLoadingTheme: cardLoadingTheme,
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardLoading(
                  height: 30,
                  width: 30,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  margin: const EdgeInsets.only(top: 12),
                  cardLoadingTheme: cardLoadingTheme,
                ),
                const SizedBox(width: 12),
                CardLoading(
                  height: 30,
                  width: 30,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  margin: const EdgeInsets.only(top: 12),
                  cardLoadingTheme: cardLoadingTheme,
                ),
              ],
            ),
          ] else ...[
            Expanded(
              child: Text(
                widget.title.toString(),
                style: GoogleFonts.urbanist(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_right,
                    weight: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.bookmark,
                    weight: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
