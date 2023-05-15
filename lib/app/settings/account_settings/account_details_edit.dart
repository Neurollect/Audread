import 'package:audread/models/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    final inputTheme = utils.inputFields.detailsInputDecoration(context);

    return ChangeNotifierProvider<AccountDetailsProvider>(
      create: (context) => AccountDetailsProvider(),
      builder: (context, _) {
        return Consumer<AccountDetailsProvider>(
          builder: (context, provider, child) {
            provider.getMember();
            MemberModel member = provider.member;
            List detailsItems = [
              ['Name', '${member.firstName!} ${member.lastName!}'],
              ['Gender', member.gender],
              ['School', member.organization],
              ['Grade', member.grade],
            ];
            return ListView(
              shrinkWrap: true,
              children: [
                for (var i in detailsItems) ...[
                  ListTile(
                    title: Text(
                      i[0],
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: isEditing
                        ? TextFormField(
                            initialValue: i[1],
                            decoration: inputTheme,
                            onChanged: (value) {
                              provider.setValue(value);
                            },
                            style: GoogleFonts.urbanist(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            i[1].toString(),
                            style: GoogleFonts.urbanist(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
