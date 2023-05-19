import 'package:audread/app/home/for_you_section.dart';
import 'package:audread/app/widgets/bottom_nav.dart';
import 'package:audread/app/widgets/header.dart';
import 'package:audread/app/widgets/navigation_drawer.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final utils = Utils();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      key: homeScaffoldKey,
      drawer: const NavDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              AudHeader(
                scaffoldKey: homeScaffoldKey,
              ),
              const SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: utils.inputFields.searchButtonDecoration(context),
              ),
              const SizedBox(height: 20),

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

              //For You Section
              const ForYouSection(),

              //AudLabs Container
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: height * 1.1,
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home/ar.png'),
                    alignment: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join AudLabs to Elevate Your Learning with\nAR ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              padding: const EdgeInsets.all(6),
                            ),
                            child: Text(
                              'Join AudLabs',
                              style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox()),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
