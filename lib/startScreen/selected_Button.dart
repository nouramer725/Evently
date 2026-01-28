import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class SelectedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const SelectedButton({
    required this.text,
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
        child: Text(
          text,
          style: AppText.semiBoldText(color: AppColors.white, fontSize: 14),
        ),
      ),
    );
  }
}
