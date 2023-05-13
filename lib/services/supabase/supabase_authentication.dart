import 'package:audread/services/supabase/supabase_user_services.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../repositories/authentication_repository.dart';

@Injectable(as: AuthenticationRepository)
class SupabaseAuthentication implements AuthenticationRepository {
  final SupabaseClient _supabaseClient;
  const SupabaseAuthentication(this._supabaseClient);

  @override
  Future signInEmailAndPassword(String email, String password) async {
    final userServices = SupabaseUserServices(_supabaseClient);

    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw UnimplementedError();
      }

      Future.wait([userServices.getUser()]);

      return user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future signUpEmailAndPassword(String email, String password) async {
    final userServices = SupabaseUserServices(_supabaseClient);

    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: "io.supabase.audread://login-callback/",
      );

      final user = response.user;

      Future.wait([userServices.getUser()]);

      return user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future verifySignUp(String email, String token) async {
    final userServices = SupabaseUserServices(_supabaseClient);

    try {
      final AuthResponse response = await _supabaseClient.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.signup,
      );

      Future.wait([userServices.getUser()]);

      return response.user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future sendRecoveryCode(String email) async {
    try {
      await _supabaseClient.auth.signInWithOtp(email: email);

      var res = 'You have recieved a password recovery code in your inbox.';
      return res;
    } catch (e) {
      return e;
    }
  }

  @override
  Future verifyRecoveryCode(String email, String token) async {
    final userServices = SupabaseUserServices(_supabaseClient);

    try {
      final AuthResponse response = await _supabaseClient.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.magiclink,
      );

      Future.wait([userServices.getUser()]);

      return response.user;
    } catch (e) {
      return e;
    }
  }

  @override
  Future<void> signOut() async {
    final userServices = SupabaseUserServices(_supabaseClient);
    userServices.onUserSignout();
    await _supabaseClient.auth.signOut();
    return;
  }
}
