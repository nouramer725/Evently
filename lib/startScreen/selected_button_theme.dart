import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class SelectedButtonTheme extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const SelectedButtonTheme({
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
              ? AppColors.mainColorDark
              : AppColors.mainColorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: themeProvider.isDarkTheme()
                ? AppColors.strokeColorDark
                : AppColors.strokeColorLight,
          ),
        ),
        child: Icon(
          icon,
          color:AppColors.inputsColorLight,
        ),
      ),
    );
  }
}
