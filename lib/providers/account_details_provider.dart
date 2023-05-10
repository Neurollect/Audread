import 'package:audread/models/member.dart';
import 'package:flutter/material.dart';

class AccountDetailsProvider with ChangeNotifier {
  MemberModel member = MemberModel(
    id: 'id',
    firstName: 'Joseph',
    lastName: 'Gakah',
    organization: 'braintraq',
    grade: 'Grade 12',
    avatar: 4,
    gender: 'Male',
  );

  changeAttribute(value) {
    member.organization = value;
    notifyListeners();
  }
}
