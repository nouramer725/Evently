import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class SelectedRowWidget extends StatelessWidget {
  final String text;

  const SelectedRowWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w(12))),
      tileColor: themeProvider.isDarkTheme()
          ? AppColors.mainColorDark.withOpacity(0.2)
          : AppColors.mainColorLight.withValues(alpha: 0.1),
      title: Text(
        text,
        style: themeProvider.isDarkTheme()
            ? AppText.mediumText(color: AppColors.mainColorDark, fontSize: 18)
            : AppText.mediumText(color: AppColors.mainColorLight, fontSize: 18),
      ),
      trailing: Icon(
        Icons.check_circle,
        color: themeProvider.isDarkTheme()
            ? AppColors.mainColorDark
            : AppColors.mainColorLight,
        size: w(28),
      ),
    );
  }
}
