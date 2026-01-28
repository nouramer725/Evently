import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/app_theme_provider.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool filled;
  final Color? fillColor;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextFormFieldWidget({
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.filled = false,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.borderRadius = 16,
    this.maxLines,
    this.validator,
    this.controller,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      style: GoogleFonts.poppins(
        color: themeProvider.isDarkTheme() ? Colors.white : Colors.black,
      ),
      cursorColor: themeProvider.isDarkTheme()
          ? AppColors.mainColorDark
          : AppColors.mainColorLight,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: suffixIconColor,
        prefixIconColor: prefixIconColor,
        fillColor: fillColor,
        filled: filled,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.redColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.redColor, width: 2),
        ),
      ),
    );
  }
}
