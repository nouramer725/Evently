import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../home/body_widget.dart';

class FavouriteTabScreen extends StatelessWidget {
  const FavouriteTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: h(100),
        title: CustomTextFormFieldWidget(
          hintText: AppLocalizations.of(context)!.search_for_event,
          hintStyle: AppText.regularText(
            color: themeProvider.isDarkTheme()
                ? AppColors.secTextColorDark
                : AppColors.secTextColorLight,
            fontSize: 14,
          ),
          borderColor: themeProvider.isDarkTheme()
              ? AppColors.strokeColorDark
              : AppColors.strokeColorLight,
          fillColor: themeProvider.isDarkTheme()
              ? AppColors.backgroundColorDark
              : AppColors.white,
          filled: true,
          borderWidth: 2,
          labelStyle: AppText.regularText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.black,
            fontSize: 14,
          ),
          suffixIcon: Icon(
            Icons.search,
            size: h(30),
            color: themeProvider.isDarkTheme()
                ? AppColors.mainColorDark
                : AppColors.mainColorLight,
          ),
        ),
      ),
      // body: ListView.separated(
      //   itemBuilder: (context, index) {
      //     return BodyWidget();
      //   },
      //   separatorBuilder: (context, index) {
      //     return SizedBox(height: h(15));
      //   },
      //   itemCount: 5,
      // ),
    );
  }
}
