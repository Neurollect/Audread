import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'For the things we have to learn before we can do them, we learn by doing them.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    elevation: 8,
                    side: BorderSide(
                      color: Colors.blue.shade800,
                    ),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    foregroundColor: Colors.blue.shade800,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
