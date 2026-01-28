import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:evently_app/widgets/custom_elevated_button_widget.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: themeProvider.isDarkTheme()
            ? Image.asset(AppAssets.eventlyLogoDark)
            : Image.asset(AppAssets.eventlyLogo),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(15), vertical: h(15)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: h(35),
            children: [
              Text(
                AppLocalizations.of(context)!.login_to_your_account,
                style: AppText.semiBoldText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.white
                      : AppColors.mainColorLight,
                  fontSize: 24,
                ),
              ),
              CustomTextFormFieldWidget(
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.transparentColor
                    : AppColors.white,
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                filled: true,
                hintText: AppLocalizations.of(context)!.enter_your_email,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: themeProvider.isDarkTheme()
                    ? AppColors.secTextColorDark
                    : AppColors.secTextColorLight,
                borderRadius: 16,
                borderWidth: 2,
              ),
              CustomTextFormFieldWidget(
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.transparentColor
                    : AppColors.white,
                filled: true,
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                hintText: AppLocalizations.of(context)!.enter_your_password,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.lock_open),
                prefixIconColor: themeProvider.isDarkTheme()
                    ? AppColors.secTextColorDark
                    : AppColors.secTextColorLight,
                borderRadius: 16,
                borderWidth: 2,
                suffixIcon: Icon(Icons.visibility_off_outlined),
                suffixIconColor: themeProvider.isDarkTheme()
                    ? AppColors.secTextColorDark
                    : AppColors.secTextColorLight,
              ),
              CustomElevatedButtonWidget(
                widget: Text(
                  AppLocalizations.of(context)!.login,
                  style: AppText.mediumText(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.homeScreenName,
                    (route) => false,
                  );
                },
                borderRadius: h(16),
                verticalPadding: h(9),
                backgroundColor: themeProvider.isDarkTheme()
                    ? WidgetStateProperty.all(AppColors.mainColorDark)
                    : WidgetStateProperty.all(AppColors.mainColorLight),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.forgetPasswordScreenName);
                    },
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
                      AppLocalizations.of(context)!.forgot_password,
                      style:
                          AppText.semiBoldText(
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
              Row(
                spacing: w(5),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dont_have_an_account,
                    style: AppText.regularText(
                      color: themeProvider.isDarkTheme()
                          ? AppColors.secTextColorDark
                          : AppColors.secTextColorLight,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.registerScreenName,
                        (route) => false,
                      );
                    },
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
                      AppLocalizations.of(context)!.signup,
                      style:
                          AppText.semiBoldText(
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
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: themeProvider.isDarkTheme()
                          ? AppColors.strokeColorDark
                          : AppColors.strokeColorLight,
                      thickness: 1,
                      endIndent: h(15),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppText.mediumText(
                      color: themeProvider.isDarkTheme()
                          ? AppColors.mainColorDark
                          : AppColors.mainColorLight,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: themeProvider.isDarkTheme()
                          ? AppColors.strokeColorDark
                          : AppColors.strokeColorLight,
                      thickness: 1,
                      indent: h(15),
                    ),
                  ),
                ],
              ),
              CustomElevatedButtonWidget(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: w(10),
                  children: [
                    Image.asset(AppAssets.googleIcon),
                    Text(
                      AppLocalizations.of(context)!.login_with_google,
                      style: AppText.mediumText(
                        color: themeProvider.isDarkTheme()
                            ? AppColors.mainColorDark
                            : AppColors.mainColorLight,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
                borderRadius: h(16),
                verticalPadding: h(9),
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.transparentColor,
                borderWidth: 2,
                backgroundColor: themeProvider.isDarkTheme()
                    ? WidgetStateProperty.all(AppColors.backgroundColorDark)
                    : WidgetStateProperty.all(AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
