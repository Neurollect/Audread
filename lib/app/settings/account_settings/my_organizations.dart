import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MyOrganizations extends StatefulWidget {
  const MyOrganizations({Key? key}) : super(key: key);

  @override
  MyOrganizationsState createState() => MyOrganizationsState();
}

class MyOrganizationsState extends State<MyOrganizations> {
  final organizations = [
    ['Veritasium', 'An element of truth - videos about science, education'],
    [
      'Physics Girl',
      'Unrepentant science nerd. In addition to founding and continuing to run Skepchick'
    ],
    [
      'Kurzgezast',
      'Animation videos explaining things with optimistic nihilism since 12013'
    ],
    ['Vsauce', 'Deeper dive into the mysterious depths of the human psyche.'],
  ];

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
              Text(
                'Organizations',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  for (var i in organizations) ...[
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                      ),
                      child: ListTile(
                        trailing: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor:
                                const Color.fromARGB(31, 0, 145, 255),
                            shape: const CircleBorder(),
                            foregroundColor:
                                const Color.fromARGB(255, 0, 36, 89),
                          ),
                          child: const Icon(
                            Iconsax.trash,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          i[0],
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          i.last,
                          style: GoogleFonts.urbanist(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'We use your personal information to provide and improve our e-learning services, to communicate with you, and to personalize your learning experience.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
