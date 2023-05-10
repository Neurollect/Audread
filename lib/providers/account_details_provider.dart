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

  var _value = '';

  setValue(value) {
    _value = value;
    notifyListeners();
  }

  changeAttribute(attribute) {
    switch (attribute) {
      case 'Name':
        member.firstName = _value.split(' ').first;
        member.lastName = _value.split(' ').last;
        break;

      case 'School':
        member.organization = _value;
        break;

      case 'Gender':
        member.gender = _value;
        break;

      case 'Grade':
        member.grade = _value;
        break;
      default:
    }
    notifyListeners();
  }
}
