import 'package:audread/app/auth/welcome/welcome_carousel.dart';
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
            const WelcomeCarousel(),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text(
                        'Sign in',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: Theme.of(context).outlinedButtonTheme.style,
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
