import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class ProfileWidget extends StatefulWidget {
  final String text;
  final Widget icon;
  final Function()? onTap;

  ProfileWidget({
    this.onTap,
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: themeProvider.isDarkTheme()
            ? AppColors.inputsColorDark
            : AppColors.inputsColorLight,
        border: Border.all(
          color: themeProvider.isDarkTheme()
              ? AppColors.strokeColorDark
              : AppColors.strokeColorLight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: themeProvider.isDarkTheme()
                ? AppText.mediumText(color: AppColors.white, fontSize: 16)
                : AppText.mediumText(
                    color: AppColors.mainTextColorLight,
                    fontSize: 16,
                  ),
          ),
          InkWell(onTap: widget.onTap, child: widget.icon),
        ],
      ),
    );
  }
}
