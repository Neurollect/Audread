import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:audread/utils/utils.dart';

final utils = Utils();

class AccountDetailsEdit extends StatefulWidget {
  const AccountDetailsEdit({Key? key}) : super(key: key);

  @override
  AccountDetailsEditState createState() => AccountDetailsEditState();
}

class AccountDetailsEditState extends State<AccountDetailsEdit> {
  bool isEditing = false;
  String value = 'Joseph Gakah';

  String school = 'Stanely Academy';
  final schoolController = TextEditingController();
  final schoolKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return //Account Actions
        ListView(
      shrinkWrap: true,
      children: [
        //Name
        ListTile(
          trailing: TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
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
              ? TextFormField(
                  initialValue: 'Joseph Gakah',
                  decoration: utils.inputFields.detailsInputDecoration(context),
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  value,
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(height: 10),

        //School
        ListTile(
          trailing: TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
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
            'Gender',
            style: GoogleFonts.urbanist(
              fontSize: 16,
            ),
          ),
          subtitle: isEditing
              ? TextFormField(
                  initialValue: 'Male',
                  decoration: utils.inputFields.detailsInputDecoration(context),
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Male',
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(height: 10),

        //School
        ListTile(
          trailing: TextButton(
            onPressed: () {
              if (isEditing) {
                if (schoolKey.currentState!.validate()) {
                  setState(() {
                    school = schoolController.value.text;
                    isEditing = !isEditing;
                  });
                }
              } else {
                setState(() {
                  isEditing = !isEditing;
                });
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
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
            'School',
            style: GoogleFonts.urbanist(
              fontSize: 16,
            ),
          ),
          subtitle: isEditing
              ? TextFormField(
                  key: schoolKey,
                  controller: schoolController,
                  decoration: utils.inputFields.detailsInputDecoration(context),
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  school,
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(height: 10),

        //School
        ListTile(
          trailing: TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
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
            'Grade/Class',
            style: GoogleFonts.urbanist(
              fontSize: 16,
            ),
          ),
          subtitle: isEditing
              ? TextFormField(
                  initialValue: 'Form 2',
                  decoration: utils.inputFields.detailsInputDecoration(context),
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Form 2',
                  style: GoogleFonts.urbanist(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
