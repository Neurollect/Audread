import 'package:audread/controllers/details_form_controller.dart';
import 'package:audread/models/avatar.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({Key? key}) : super(key: key);

  @override
  DetailsFormState createState() => DetailsFormState();
}

class DetailsFormState extends State<DetailsForm> {
  final utils = Utils();
  final controller = DetailsFormController();

  List<List<String>> genders = [
    ['assets/images/avatars/mikee.png', 'Male'],
    ['assets/images/avatars/kyia.png', 'Female'],
    ['assets/images/avatars/kyia.png', 'Other'],
  ];

  String gender = '';
  bool isAvatarSelected = false;
  bool checked = false;
  AvatarModel avatar = AvatarModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What should we call you?',
            style: GoogleFonts.urbanist(fontSize: 20),
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: utils.inputFields.textInput(
                  ['First Name', 'John', Icons.person],
                  controller.firstName,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: utils.inputFields.textInput(
                  ['Last Name', 'Doe', Icons.person],
                  controller.lastName,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            "Where do you study?",
            style: GoogleFonts.urbanist(fontSize: 20),
          ),
          const SizedBox(height: 11),
          utils.inputFields.textInput(
            ['First Name', 'Drake Schools', Icons.school],
            controller.organization,
          ),
          const SizedBox(height: 25),
          Text(
            "What's your Gender?",
            style: GoogleFonts.urbanist(fontSize: 20),
          ),
          const SizedBox(height: 11),
          MultiSelectContainer(
            onChange: (List<Object?> selectedItems, Object? selectedItem) {
              setState(() {
                gender = selectedItem.toString();
                checked = !checked;
                if (checked) {
                  buildShowModalBottomSheet(context);
                } else {
                  isAvatarSelected = false;
                }
              });
            },
            controller: controller.gender,
            maxSelectableCount: 1,
            itemsPadding: const EdgeInsets.all(0),
            itemsDecoration: MultiSelectDecorations(
              decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.1)),
              selectedDecoration: BoxDecoration(
                color: Colors.blue.shade500,
              ),
            ),
            items: [
              for (var i in genders) ...[
                MultiSelectCard(
                  value: i[1],
                  child: selectItem(i[0], i[1]),
                ),
              ]
            ],
          ),
          const SizedBox(height: 25),
          if (isAvatarSelected) ...[
            Text(
              "My Avatar?",
              style: GoogleFonts.urbanist(fontSize: 20),
            ),
            const SizedBox(height: 11),
            selectItem(avatar.path, avatar.name)
          ],
          const SizedBox(height: 25),
          utils.buttons.authButton(
            'Create Profiles',
            () => controller.submitDetails(context),
            context,
          ),
        ],
      ),
    );
  }

  Widget selectItem(image, name) {
    double side = MediaQuery.of(context).size.width / 5;
    return Container(
      height: side,
      width: side,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.8,
          image: AssetImage(image),
        ),
      ),
      child: Text(
        name.toString().toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MultiSelectContainer(
                onChange: (List<Object?> selectedItems, Object? selectedItem) {
                  setState(() {
                    avatar = selectedItem as AvatarModel;
                    isAvatarSelected = !isAvatarSelected;
                  });
                },
                controller: controller.avatar,
                maxSelectableCount: 1,
                itemsPadding: const EdgeInsets.all(0),
                itemsDecoration: MultiSelectDecorations(
                  decoration:
                      BoxDecoration(color: Colors.indigo.withOpacity(0.1)),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue.shade500,
                  ),
                ),
                items: [
                  if (gender == 'Male') ...[
                    for (var i in utils.avatars.maleAvatars) ...[
                      MultiSelectCard(
                        value: i,
                        child: selectItem(i.path, i.name),
                      ),
                    ],
                  ],
                  if (gender == 'Female') ...[
                    for (var i in utils.avatars.femaleAvatars) ...[
                      MultiSelectCard(
                        value: i,
                        child: selectItem(i.path, i.name),
                      ),
                    ],
                  ],
                  if (gender == 'Other') ...[
                    for (var i in utils.avatars.maleAvatars) ...[
                      MultiSelectCard(
                        value: i,
                        child: selectItem(i.path, i.name),
                      ),
                    ],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
