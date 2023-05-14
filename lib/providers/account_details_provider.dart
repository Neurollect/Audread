import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/member.dart';

class AccountDetailsProvider with ChangeNotifier {
  MemberModel member = MemberModel(
    id: 'id',
    firstName: 'loading',
    lastName: '...',
    organization: 'loading..',
    grade: 'loading..',
    avatar: 4,
    gender: 'loading...',
  );

  getMember() async {
    final memberBox = await Hive.openBox<MemberModel>('member_box');
    member = memberBox.get('member')!;
    notifyListeners();
  }

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
