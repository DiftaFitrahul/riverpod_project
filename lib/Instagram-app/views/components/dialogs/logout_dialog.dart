import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_project/Instagram-app/views/components/dialogs/alert_dialog_model.dart';

import '../constants/string.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog() : super(
    title: Strings.logout,
    message: Strings.areYouSureThatYouWantToLogOutOgTheeApp,
    buttons: const {
      Strings.cancel : false,
      Strings.logout : true,
    }
  );
}
