import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorLight,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.mainColorLight),
      actionsIconTheme: IconThemeData(color: AppColors.mainColorLight),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColorLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.inputsColorLight,
        foregroundColor: AppColors.mainColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.strokeColorLight),
        ),
        textStyle: AppText.semiBoldText(
          color: AppColors.mainColorLight,
          fontSize: 14,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.inputsColorLight,
      selectedItemColor: AppColors.mainColorLight,
      unselectedItemColor: AppColors.disableColorLight,
      selectedIconTheme: IconThemeData(
        color: AppColors.mainColorLight,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.disableColorLight,
        size: 24,
      ),
      selectedLabelStyle: AppText.regularText(
        color: AppColors.mainColorLight,
        fontSize: 12,
      ),
      unselectedLabelStyle: AppText.regularText(
        color: AppColors.disableColorLight,
        fontSize: 12,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorLight,
      foregroundColor: AppColors.inputsColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 0,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundColorLight,
    ),

    timePickerTheme: TimePickerThemeData(
      helpTextStyle: AppText.semiBoldText(
        color: AppColors.mainTextColorLight,
        fontSize: 16,
      ),
      backgroundColor: AppColors.backgroundColorLight,
      hourMinuteTextColor: AppColors.white,
      hourMinuteColor: AppColors.mainColorLight,
      dayPeriodTextColor: AppColors.disableColorLight,
      dayPeriodColor: AppColors.mainColorLight,
      dialHandColor: AppColors.mainColorLight,
      dialBackgroundColor: AppColors.white,
      entryModeIconColor: AppColors.mainColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColorLight,
      headerBackgroundColor: AppColors.backgroundColorLight,
      headerForegroundColor: AppColors.black,
      dayForegroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disableColorLight;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.mainTextColorLight;
      }),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainColorLight;
        }
        return Colors.transparent;
      }),
      todayForegroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.mainColorLight,
      ),
      todayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
      weekdayStyle: AppText.semiBoldText(
        color: AppColors.disableColorLight,
        fontSize: 12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputsColorLight,
        hintStyle: AppText.mediumText(
          color: AppColors.mainTextColorLight,
          fontSize: 14,
        ),
        labelStyle: AppText.mediumText(
          color: AppColors.mainTextColorLight,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.mainColorLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.mainColorLight),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorDark,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.mainColorDark),
      actionsIconTheme: IconThemeData(color: AppColors.mainColorDark),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColorDark,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppText.semiBoldText(
          color: AppColors.mainColorLight,
          fontSize: 14,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.inputsColorDark,
        foregroundColor: AppColors.mainTextColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.strokeColorDark),
        ),
        textStyle: AppText.semiBoldText(
          color: AppColors.mainColorLight,
          fontSize: 14,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColorDark,
      selectedItemColor: AppColors.mainColorDark,
      unselectedItemColor: AppColors.disableColorDark,
      selectedIconTheme: IconThemeData(
        color: AppColors.mainColorDark,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.disableColorDark,
        size: 24,
      ),
      selectedLabelStyle: AppText.regularText(
        color: AppColors.mainColorDark,
        fontSize: 12,
      ),
      unselectedLabelStyle: AppText.regularText(
        color: AppColors.disableColorDark,
        fontSize: 12,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorDark,
      foregroundColor: AppColors.inputsColorDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 0,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundColorDark,
    ),

    timePickerTheme: TimePickerThemeData(
      helpTextStyle: AppText.semiBoldText(
        color: AppColors.mainTextColorDark,
        fontSize: 16,
      ),
      backgroundColor: AppColors.backgroundColorDark,
      hourMinuteTextColor: AppColors.mainTextColorDark,
      hourMinuteColor: AppColors.mainColorDark,
      dayPeriodTextColor: AppColors.mainTextColorDark,
      dayPeriodColor: AppColors.mainColorDark,
      dialHandColor: AppColors.mainColorDark,
      dialBackgroundColor: AppColors.white,
      entryModeIconColor: AppColors.mainColorDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColorDark,
      headerBackgroundColor: AppColors.backgroundColorDark,
      headerForegroundColor: AppColors.white,
      dayForegroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disableColorDark;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.mainTextColorDark;
      }),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainColorDark;
        }
        return Colors.transparent;
      }),
      todayForegroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.mainColorDark,
      ),
      todayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
      weekdayStyle: AppText.semiBoldText(
        color: AppColors.disableColorDark,
        fontSize: 12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputsColorDark,
        hintStyle: AppText.mediumText(
          color: AppColors.disableColorDark,
          fontSize: 14,
        ),
        labelStyle: AppText.mediumText(
          color: AppColors.mainTextColorDark,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.strokeColorDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.mainColorDark),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
