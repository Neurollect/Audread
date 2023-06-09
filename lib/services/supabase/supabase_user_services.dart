import 'package:audread/models/member.dart';
import 'package:audread/models/user.dart';
import 'package:audread/repositories/user_repository.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserServices implements UserRepository {
  final SupabaseClient _supabaseClient;
  const SupabaseUserServices(this._supabaseClient);

  @override
  Future getUser() async {
    final userBox = await Hive.openBox<UserModel>('user_box');
    try {
      User usr = _supabaseClient.auth.currentSession!.user;

      final res = await _supabaseClient
          .from('profiles')
          .select()
          .eq('user_id', usr.id)
          .single();

      final user = UserModel.fromJson(res);
      Future.wait([
        userBox.delete('user'),
        userBox.put('user', user),
      ]);

      bool isNew = user.isNewUser == null;
      if (!isNew) {
        getMemberProfile(user.memberId.toString());
      }

      return user;
    } catch (e) {
      return e;
    }
  }

  @override
  Future getMemberProfile(String memberId) async {
    final memberBox = await Hive.openBox<MemberModel>('member_box');

    try {
      final res = await _supabaseClient
          .from('members')
          .select()
          .eq('member_id', memberId)
          .single();

      final member = MemberModel.fromJson(res);
      await memberBox.put('member', member);
      Future.wait([getUser()]);

      return member;
    } catch (e) {
      return e;
    }
  }

  @override
  Future createMemberProfile(String firstName, String lastName, int? avatar,
      String gender, String grade, String organization) async {
    final userId = _supabaseClient.auth.currentUser?.id;
    try {
      final res = await _supabaseClient.rpc(
        'create_member',
        params: {
          'p_first_name': firstName,
          'p_last_name': lastName,
          'p_avatar': avatar,
          'p_gender': gender,
          'p_grade': grade,
          'p_organization': organization,
          'p_user_id': userId,
        },
      ).select();

      Future.wait([
        getUser(),
        getMemberProfile(res),
      ]);

      return res;
    } catch (e) {
      return e;
    }
  }

  @override
  Future chageUserPassword(String opassward, String npassword) async {
    try {
      final response = await _supabaseClient.rpc(
        'change_user_password',
        params: {
          'current_plain_password': opassward,
          'new_plain_password': npassword,
        },
      );

      return response;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future onUserSignout() async {
    final memberBox = await Hive.openBox<MemberModel>('member_box');
    final userBox = await Hive.openBox<UserModel>('user_box');

    Future.wait([
      memberBox.clear(),
      userBox.clear(),
    ]);
  }
}
