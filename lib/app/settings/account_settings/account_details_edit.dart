import 'package:audread/models/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:audread/providers/account_details_provider.dart';
import 'package:audread/utils/utils.dart';

final utils = Utils();

class AccountDetailsEdit extends StatefulWidget {
  const AccountDetailsEdit({Key? key}) : super(key: key);

  @override
  AccountDetailsEditState createState() => AccountDetailsEditState();
}

class AccountDetailsEditState extends State<AccountDetailsEdit> {
  bool isEditing = false;
  final schoolController = TextEditingController();
  final schoolKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final inputTheme = utils.inputFields.detailsInputDecoration(context);

    return ChangeNotifierProvider<AccountDetailsProvider>(
      create: (context) => AccountDetailsProvider(),
      builder: (context, _) {
        return Consumer<AccountDetailsProvider>(
          builder: (context, provider, child) {
            MemberModel member = provider.member;
            return ListView(
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
                      isEditing ? Icons.save_outlined : Iconsax.edit_2,
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
                          decoration: inputTheme,
                          initialValue: member.firstName! + member.lastName!,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          '${member.firstName!} ${member.lastName!}',
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 10),

                //Gender
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
                          initialValue: member.gender,
                          decoration: inputTheme,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          member.gender!,
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
                            provider.changeAttribute(
                              schoolController.value.text,
                            );
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
                          decoration: inputTheme,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          member.organization!,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 10),

                //Grade
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
                          initialValue: member.grade,
                          decoration: inputTheme,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          member.grade!,
                          style: GoogleFonts.urbanist(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }
}
