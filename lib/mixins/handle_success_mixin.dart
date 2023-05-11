import 'package:audread/utils/components/snack_message.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

mixin HandleSuccessMixin {
  handleSuccess(context, mes) {
    ShowErrorMessage.showMessage(
      context,
      ContentType.failure,
      mes,
      'Success',
    );
  }
}
