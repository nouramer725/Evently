import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/app_firebase_provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../home/body_widget.dart';

class FavouriteTabScreen extends StatefulWidget {
  const FavouriteTabScreen({super.key});

  @override
  State<FavouriteTabScreen> createState() => _FavouriteTabScreenState();
}

class _FavouriteTabScreenState extends State<FavouriteTabScreen> {
  late AppFirebaseProvider eventProvider;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventProvider.getFavouriteEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventProvider = Provider.of<AppFirebaseProvider>(context);

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
      body: eventProvider.favouriteList.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.no_favourite_item_found,
                style: AppText.boldText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: 20,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return BodyWidget(event: eventProvider.favouriteList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: h(15));
              },
              itemCount: eventProvider.favouriteList.length,
            ),
    );
  }
}
