import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/utils/custom_flutter_toast.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:evently_app/widgets/custom_elevated_button_widget.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(
    text: "nouramer725@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "nour12345",
  );

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
          child: Form(
            key: formKey,
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
                    fontSize: sp(24),
                  ),
                ),
                CustomTextFormFieldWidget(
                  controller: emailController,
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
                    fontSize: sp(14),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value);
                      if (!emailValid) {
                        return AppLocalizations.of(context)!.please_enter_email;
                      }
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                  prefixIconColor: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  borderRadius: h(16),
                  borderWidth: 2,
                ),
                CustomTextFormFieldWidget(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_password;
                    } else if (value.length < 6) {
                      return AppLocalizations.of(context)!.at_least_6_char;
                    } else {
                      return null;
                    }
                  },
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
                    fontSize: sp(14),
                  ),
                  prefixIcon: Icon(Icons.lock_open),
                  prefixIconColor: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  borderRadius: h(16),
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
                      fontSize: sp(20),
                    ),
                  ),
                  onPressed: () {
                    login(context);
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
                  spacing: w(5),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.dont_have_an_account,
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
                          AppLocalizations.of(context)!.login_with_google,
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
      ),
    );
  }

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        CustomFlutterToast.loadingToast(
          context,
          Colors.orange,
          Colors.white,
          ToastGravity.TOP,
        );
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        CustomFlutterToast.successToast(
          context,
          Colors.green,
          Colors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.login_success,
        );
        Duration(seconds: 10);
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeScreenName,
              (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          CustomFlutterToast.failToast(
            context,
            Colors.red,
            Colors.white,
            ToastGravity.TOP,
            AppLocalizations.of(context)!.no_user_found,
          );
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          CustomFlutterToast.failToast(
            context,
            Colors.red,
            Colors.white,
            ToastGravity.TOP,
            AppLocalizations.of(context)!.wrong_password,
          );
          print('Wrong password provided for that user.');
        } else {
          CustomFlutterToast.failToast(
            context,
            Colors.red,
            Colors.white,
            ToastGravity.TOP,
            AppLocalizations.of(context)!.no_user_found,
          );
        }
      } catch (e) {
        print(e.toString());
        print(e);
      }
    }
  }
}
