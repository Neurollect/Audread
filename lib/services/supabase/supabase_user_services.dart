import 'package:audread/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserServices implements UserRepository {
  final SupabaseClient _supabaseClient;
  const SupabaseUserServices(this._supabaseClient);

  @override
  Future getUser(String userId) async {
    try {
      final res =
          await _supabaseClient.from('profiles').select().eq('user_id', userId);
      return res;
    } catch (e) {
      return e;
    }
  }

  @override
  Future getMemberProfile(String memberId) async {
    try {
      final res = await _supabaseClient
          .from('members')
          .select()
          .eq('member_id', memberId);
      return res;
    } catch (e) {
      return e;
    }
  }

  @override
  Future createMemberProfile(String firstName, String lastName, int avatar,
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
          'user_id': userId,
        },
      ).select();
      return res;
    } catch (e) {
      return e;
    }
  }
}
