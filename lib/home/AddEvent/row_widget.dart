import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text.dart';
import '../../utils/responsive.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final String chooseText;
  final IconData icon;
  final Function()? onPressed;
  final String? errorText;

  RowWidget({
    required this.text,
    required this.chooseText,
    required this.icon,
    this.onPressed,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: themeProvider.isDarkTheme()
                  ? AppColors.mainColorDark
                  : AppColors.mainColorLight,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                text,
                style: AppText.mediumText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: 14,
                ),
              ),
            ),
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
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: h(5), horizontal: w(10)),
            child: Text(
              errorText!,
              style: AppText.mediumText(
                color: AppColors.redColor,
                fontSize: sp(11),
              ),
            ),
          ),
      ],
    );
  }
}
