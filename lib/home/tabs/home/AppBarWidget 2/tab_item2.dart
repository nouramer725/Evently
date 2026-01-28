import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_theme_provider.dart';
import '../../../../utils/app_text.dart';

class TabItem2 extends StatelessWidget {
  final String text;
  final IconData widget;
  final bool isSelected;

  const TabItem2({
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
                  : AppColors.white
            :  AppColors.transparentColor,
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
                ? themeProvider.isDarkTheme()
                      ? AppColors.white
                      : AppColors.mainColorLight
                : themeProvider.isDarkTheme()
                ? AppColors.mainColorDark
                : AppColors.white,
          ),
          Text(
            text,
            style: isSelected
                ? AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.white
                        : AppColors.mainColorLight,
                    fontSize: 16,
                  )
                : AppText.mediumText(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
          ),
        ],
      ),
    );
  }
}
