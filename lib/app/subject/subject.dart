import 'package:audread/app/widgets/subject_view_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({Key? key}) : super(key: key);

  @override
  SubjectViewState createState() => SubjectViewState();
}

class SubjectViewState extends State<SubjectView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SubjectViewHeader(),
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  //Get Started Container
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/home/wyltl.png'),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What would you like to learn today?',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.all(6),
                                ),
                                child: Text(
                                  'Get Started',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Expanded(flex: 2, child: SizedBox()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
