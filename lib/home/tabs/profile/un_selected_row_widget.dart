import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class UnSelectedRowWidget extends StatelessWidget {
  String text;
  UnSelectedRowWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w(12))),
      title: Text(
        text,
        style: themeProvider.isDarkTheme()
            ? AppText.mediumText(color: AppColors.white, fontSize: 18)
            : AppText.mediumText(color: AppColors.black, fontSize: 18),
      ),
    );
  }
}
