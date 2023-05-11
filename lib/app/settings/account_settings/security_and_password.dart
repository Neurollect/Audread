import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class SecurityAndPasswordSettings extends StatefulWidget {
  const SecurityAndPasswordSettings({Key? key}) : super(key: key);

  @override
  SecurityAndPasswordSettingsState createState() =>
      SecurityAndPasswordSettingsState();
}

class SecurityAndPasswordSettingsState
    extends State<SecurityAndPasswordSettings> {
  bool checked = false;

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    //double side = MediaQuery.of(context).size.width / 6;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: const EdgeInsets.only(left: 18),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
              shape: const CircleBorder(),
              foregroundColor: const Color.fromARGB(255, 0, 36, 89),
            ),
            child: const Icon(
              Iconsax.arrow_left,
              size: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Security\n& Password',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'You can change your password here.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Old Password',
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    utils.inputFields.passwordInput(
                      _obscureText,
                      _toggle,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Enter your New Password',
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    utils.inputFields.passwordInput(
                      _obscureText,
                      _toggle,
                    ),
                    const SizedBox(height: 30),
                    utils.buttons.authButton(
                      'Change Password',
                      () => {},
                      context,
                    ),
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
