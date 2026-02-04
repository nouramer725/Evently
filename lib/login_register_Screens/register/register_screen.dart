import 'package:evently_app/utils/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../Models/my_user.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_firebase_provider.dart';
import '../../provider/app_theme_provider.dart';
import '../../provider/user_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_text.dart';
import '../../utils/custom_flutter_toast.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_elevated_button_widget.dart';
import '../../widgets/custom_text_form_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(
    text: "nouramer725@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "nour12345",
  );
  TextEditingController nameController = TextEditingController(text: "Nour");
  TextEditingController confirmPasswordController = TextEditingController(
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
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_name;
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
                  controller: emailController,
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
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_confirm_password;
                    } else if (value.length < 6) {
                      return AppLocalizations.of(context)!.at_least_6_char;
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      return AppLocalizations.of(context)!.password_not_match;
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
                  onPressed: () {
                    register(context);
                  },
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
      ),
    );
  }

  void register(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        CustomFlutterToast.loadingToast(
          context,
          Colors.orange,
          Colors.white,
          ToastGravity.TOP,
        );
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );

        /// save for home with provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        MyUser myUser = MyUser(
          id: credential.user?.uid ?? "",
          name: nameController.text,
          email: emailController.text,
        );
        userProvider.updateUser(myUser);

        /// get all events depend on index
        var eventProvider = Provider.of<AppFirebaseProvider>(
          context,
          listen: false,
        );
        eventProvider.changeIndex(0, userProvider.currentUser!.id);
        eventProvider.getAllDataFromFireBase(userProvider.currentUser!.id);

        /// save in firestore
        await FirebaseUtils.addUserToFirestore(myUser);

        ///success registration
        CustomFlutterToast.successToast(
          context,
          Colors.green,
          Colors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.register_success,
        );
        Duration(seconds: 5);
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.loginScreenName,
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomFlutterToast.failToast(
          context,
          Colors.red,
          Colors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.weak_password,
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        CustomFlutterToast.failToast(
          context,
          Colors.red,
          Colors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.account_already_exist,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
