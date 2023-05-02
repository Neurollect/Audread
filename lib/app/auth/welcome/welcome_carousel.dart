import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeCarousel extends StatelessWidget {
  const WelcomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: PageView(
            onPageChanged: ((value) {
              pageIndex = value;
            }),
            children: [
              for (var i = 0; i < 3; i++) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/images/discover.png',
                      ),
                    ),
                    Text(
                      'LEARN ON THE GO',
                      style: GoogleFonts.urbanist(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'For the things we have to learn before we can do them, we learn by doing them.',
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
