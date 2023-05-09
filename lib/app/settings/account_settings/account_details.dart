import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  AccountDetailsState createState() => AccountDetailsState();
}

class AccountDetailsState extends State<AccountDetails> {
  bool isEditing = false;
  String value = 'Joseph Gakah';

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
                'Account\nDetails',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),

              //Account Actions
              ListView(
                shrinkWrap: true,
                children: [
                  //Name
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                        onPressed: () {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(31, 0, 145, 255),
                          shape: const CircleBorder(),
                          foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                        ),
                        child: Icon(
                          isEditing ? Icons.save_outlined : Iconsax.edit,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Name',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: isEditing
                          ? utils.inputFields.detailsInput(
                              context,
                              value,
                            )
                          : Text(
                              value,
                              style: GoogleFonts.urbanist(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
