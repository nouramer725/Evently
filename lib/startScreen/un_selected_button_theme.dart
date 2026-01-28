import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class UnSelectedButtonTheme extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const UnSelectedButtonTheme({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(5.5)),
        decoration: BoxDecoration(
          color: themeProvider.isDarkTheme()
              ? AppColors.inputsColorDark
              : AppColors.inputsColorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: themeProvider.isDarkTheme()
                ? AppColors.strokeColorDark
                : AppColors.strokeColorLight,
          ),
        ),
        child: Icon(
          icon,
          color: themeProvider.isDarkTheme()
              ? AppColors.inputsColorLight
              : AppColors.mainColorLight,
        ),
      ),
    );
  }
}
