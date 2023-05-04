import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeCarousel extends StatefulWidget {
  const WelcomeCarousel({Key? key}) : super(key: key);

  @override
  WelcomeCarouselState createState() => WelcomeCarouselState();
}

class WelcomeCarouselState extends State<WelcomeCarousel> {
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;

    final List<List<String>> carouselItems = [
      [
        'LEARN ON THE GO',
        'assets/images/discover.png',
        'For the things we have to learn before we can do them, we learn by doing them.'
      ],
      [
        'GET STARTED FOR FREE',
        'assets/images/get-started.png',
        'For the things we have to learn before we can do them, we learn by doing them.'
      ],
      [
        'A WORTHY EXPERIENCE',
        'assets/images/testimonials.png',
        'For the things we have to learn before we can do them, we learn by doing them.'
      ],
    ];

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          child: PageView(
            onPageChanged: ((value) {
              pageIndex = value;
            }),
            children: [
              for (var i in carouselItems) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        i[1],
                      ),
                    ),
                    Text(
                      i[0],
                      style: GoogleFonts.urbanist(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        i[2],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
        CarouselIndicator(
          activeColor: Colors.blue.shade900,
          color: Colors.blue.shade400,
          index: pageIndex,
          count: 3,
        ),
      ],
    );
  }
}
