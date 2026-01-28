import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_theme_provider.dart';
import '../../../../utils/app_text.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData widget;
  final bool isSelected;

  const TabItem({
    required this.isSelected,
    required this.widget,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(8)),
      decoration: BoxDecoration(
        color: isSelected
            ? themeProvider.isDarkTheme()
                  ? AppColors.mainColorDark
                  : AppColors.mainColorLight
            : themeProvider.isDarkTheme()
            ? AppColors.transparentColor
            : AppColors.white,
        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : themeProvider.isDarkTheme()
              ? AppColors.strokeColorDark
              : AppColors.strokeColorLight,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        spacing: w(7),
        children: [
          Icon(
            widget,
            color: isSelected
                ? AppColors.white
                : themeProvider.isDarkTheme()
                ? AppColors.mainColorDark
                : AppColors.mainColorLight,
          ),
          Text(
            text,
            style: isSelected
                ? AppText.mediumText(color: AppColors.white, fontSize: 16)
                : AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.white
                        : AppColors.mainTextColorLight,
                    fontSize: 16,
                  ),
          ),
        ],
      ),
    );
  }
}
