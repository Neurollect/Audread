import 'package:audread/services/snack_message.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin HandleExceptions {
  handleExceptions(context, err) {
    if (err.runtimeType == AuthException) {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        err.message,
        'Authentication Error',
      );
    }
  }
}
