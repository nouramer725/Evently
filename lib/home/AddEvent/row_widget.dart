import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text.dart';

class RowWidget extends StatelessWidget {
  String text;
  String chooseText;
  IconData icon;
  Function()? onPressed;
  RowWidget({
    required this.text,
    required this.chooseText,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Row(
      spacing: 5,
      children: [
        Icon(
          icon,
          color: themeProvider.isDarkTheme()
              ? AppColors.mainColorDark
              : AppColors.mainColorLight,
        ),
        Text(
          text,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.mainTextColorDark
                : AppColors.mainTextColorLight,
            fontSize: 14,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              AppColors.transparentColor,
            ),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.center,
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
            ),
          ),
          child: Text(
            chooseText,
            style:
                AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainColorDark
                      : AppColors.mainColorLight,
                  fontSize: 14,
                ).copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: themeProvider.isDarkTheme()
                      ? AppColors.mainColorDark
                      : AppColors.mainColorLight,
                ),
          ),
        ),
      ],
    );
  }
}
