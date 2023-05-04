import 'dart:io';

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

    if (err.runtimeType == PostgrestException) {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        err.message,
        'Server Error',
      );
    } else {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        'Connection Error, Please Connect to the Internet',
        'Server Error',
      );
    }
  }
}
