import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_text.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_elevated_button_widget.dart';
import '../../widgets/custom_text_form_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            spacing: h(25),
            children: [
              Text(
                AppLocalizations.of(context)!.create_your_account,
                style: AppText.semiBoldText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.white
                      : AppColors.mainColorLight,
                  fontSize: sp(24),
                ),
              ),
              CustomTextFormFieldWidget(
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.transparentColor
                    : AppColors.white,
                filled: true,
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                hintText: AppLocalizations.of(context)!.enter_your_name,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: sp(14),
                ),
                prefixIcon: Icon(Icons.person_outline_outlined),
                prefixIconColor: themeProvider.isDarkTheme()
                    ? AppColors.secTextColorDark
                    : AppColors.secTextColorLight,
                borderRadius: sp(16),
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
                hintText: AppLocalizations.of(context)!.enter_your_email,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: sp(14),
                ),
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: themeProvider.isDarkTheme()
                    ? AppColors.secTextColorDark
                    : AppColors.secTextColorLight,
                borderRadius: sp(16),
                borderWidth: 2,
              ),
              CustomTextFormFieldWidget(
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.transparentColor
                    : AppColors.white,
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                filled: true,
                hintText: AppLocalizations.of(context)!.enter_your_password,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: sp(14),
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
              CustomTextFormFieldWidget(
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.transparentColor
                    : AppColors.white,
                filled: true,
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                hintText: AppLocalizations.of(context)!.confirm_your_password,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: sp(14),
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
                  AppLocalizations.of(context)!.signup_space,
                  style: AppText.mediumText(
                    color: AppColors.white,
                    fontSize: sp(20),
                  ),
                ),
                onPressed: () {},
                borderRadius: h(16),
                verticalPadding: h(9),
                backgroundColor: themeProvider.isDarkTheme()
                    ? WidgetStateProperty.all(AppColors.mainColorDark)
                    : WidgetStateProperty.all(AppColors.mainColorLight),
              ),
              Row(
                spacing: w(5),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.already_have_an_account,
                      style: AppText.regularText(
                        color: themeProvider.isDarkTheme()
                            ? AppColors.secTextColorDark
                            : AppColors.secTextColorLight,
                        fontSize: sp(14),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginScreenName,
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
                      AppLocalizations.of(context)!.login,
                      style:
                          AppText.semiBoldText(
                            color: themeProvider.isDarkTheme()
                                ? AppColors.mainColorDark
                                : AppColors.mainColorLight,
                            fontSize: sp(14),
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
                      fontSize: sp(16),
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
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.sign_up_with_google,
                        style: AppText.mediumText(
                          color: themeProvider.isDarkTheme()
                              ? AppColors.mainColorDark
                              : AppColors.mainColorLight,
                          fontSize: sp(20),
                        ),
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
