import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/responsive.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w(5), vertical: h(5)),
            decoration: BoxDecoration(
              color: themeProvider.isDarkTheme()
                  ? AppColors.transparentColor
                  : AppColors.white,
              border: Border.all(
                color: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: themeProvider.isDarkTheme()
                  ? AppColors.white
                  : AppColors.mainColorLight,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.forgot_password_without_question,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(20), vertical: h(20)),
        child: SingleChildScrollView(
          child: Column(
            spacing: h(30),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.forgetPassword, fit: BoxFit.fill),
              CustomElevatedButtonWidget(
                widget: Text(AppLocalizations.of(context)!.reset_password),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
