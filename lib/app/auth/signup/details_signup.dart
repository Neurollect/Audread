import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_form.dart';

class DetailsSignup extends StatefulWidget {
  const DetailsSignup({Key? key}) : super(key: key);

  @override
  DetailsSignupState createState() => DetailsSignupState();
}

class DetailsSignupState extends State<DetailsSignup> with LoadingMixin {
  @override
  Widget build(BuildContext context) {
    isLoading(false, context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Complete\nSignup',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const DetailsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
