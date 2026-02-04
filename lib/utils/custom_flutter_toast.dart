import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../l10n/app_localizations.dart';

class CustomFlutterToast {
  static void loadingToast(
    BuildContext context,
    Color backgroundColor,
    Color textColor,
    ToastGravity toastGravity,
  ) {
    Fluttertoast.showToast(
      msg: AppLocalizations.of(context)!.loading,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  static void successToast(
    BuildContext context,
    Color backgroundColor,
    Color textColor,
    ToastGravity toastGravity,
    String msg,
  ) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  static void failToast(
      BuildContext context,
      Color backgroundColor,
      Color textColor,
      ToastGravity toastGravity,
      String msg,
      ) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
