import 'package:evently_app/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../Models/event_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../provider/app_firebase_provider.dart';
import '../../../../provider/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_text.dart';
import '../../../../utils/custom_flutter_toast.dart';
import '../../../../utils/responsive.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventProvider = Provider.of<AppFirebaseProvider>(context);
    Event event = eventProvider.eventList.firstWhere(
      (element) => element.id == ModalRoute.of(context)!.settings.arguments,
    );
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w(7), vertical: h(8)),
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
          AppLocalizations.of(context)!.event_details,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.editScreen,
                arguments: event.id,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w(10), vertical: h(8)),
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
              child: themeProvider.isDarkTheme()
                  ? Image.asset(AppAssets.editIconDark)
                  : Image.asset(AppAssets.editIconLight),
            ),
          ),
          InkWell(
            onTap: () {
              deleteEvent(context, themeProvider, eventProvider, event);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w(10), vertical: h(8)),
              margin: EdgeInsets.symmetric(horizontal: w(5), vertical: h(2)),
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
              child: themeProvider.isDarkTheme()
                  ? Image.asset(AppAssets.deleteIconDark)
                  : Image.asset(AppAssets.deleteIconLight),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: h(16),
            children: [
              Container(
                width: double.infinity,
                height: h(193),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(event.eventImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                event.eventTitle,
                style: AppText.mediumText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: sp(18),
                ),
              ),
              Container(
                width: double.infinity,
                height: h(76),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.strokeColorDark
                        : AppColors.strokeColorLight,
                  ),
                  color: themeProvider.isDarkTheme()
                      ? AppColors.transparentColor
                      : AppColors.white,
                ),
                child: Row(
                  spacing: w(10),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: w(10),
                        vertical: h(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: w(10),
                        vertical: h(10),
                      ),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkTheme()
                            ? AppColors.backgroundColorDark
                            : AppColors.backgroundColorLight,
                        border: Border.all(
                          color: themeProvider.isDarkTheme()
                              ? AppColors.strokeColorDark
                              : AppColors.strokeColorLight,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.date_range,
                        color: themeProvider.isDarkTheme()
                            ? AppColors.mainColorDark
                            : AppColors.mainColorLight,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('d MMMM').format(event.eventDate),
                          style: AppText.mediumText(
                            color: themeProvider.isDarkTheme()
                                ? AppColors.mainColorDark
                                : AppColors.mainTextColorLight,
                            fontSize: sp(16),
                          ),
                        ),
                        Text(
                          event.eventTime,
                          style: AppText.mediumText(
                            color: themeProvider.isDarkTheme()
                                ? AppColors.disableColorDark
                                : AppColors.disableColorLight,
                            fontSize: sp(16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                AppLocalizations.of(context)!.description,
                style: AppText.mediumText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: sp(18),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: w(10),
                  vertical: h(10),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.strokeColorDark
                        : AppColors.strokeColorLight,
                  ),
                  color: themeProvider.isDarkTheme()
                      ? AppColors.transparentColor
                      : AppColors.white,
                ),
                child: Text(
                  AppLocalizations.of(context)!.description,
                  style: AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.mainTextColorDark
                        : AppColors.mainTextColorLight,
                    fontSize: sp(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteEvent(
    BuildContext context,
    AppThemeProvider themeProvider,
    AppFirebaseProvider eventProvider,
    Event event,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final uId = user.uid;

    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: themeProvider.isDarkTheme()
            ? AppColors.backgroundColorDark
            : AppColors.backgroundColorLight,
        title: Text(
          AppLocalizations.of(context)!.confirm_delete,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: sp(18),
          ),
        ),
        content: Text(
          AppLocalizations.of(context)!.are_you_sure_delete_event,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: sp(12),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await eventProvider.deleteEventData(event, uId);

        CustomFlutterToast.successToast(
          context,
          themeProvider.isDarkTheme()
              ? AppColors.mainColorDark
              : AppColors.mainColorLight,
          AppColors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.event_deleted_successfully,
        );

        await eventProvider.getAllDataFromFireBase(uId);

        Navigator.pop(context);
      } catch (e) {
        CustomFlutterToast.failToast(
          context,
          AppColors.redColor,
          AppColors.white,
          ToastGravity.TOP,
          AppLocalizations.of(context)!.error_deleting_event,
        );
        print('Error deleting event: $e');
      }
    }
  }
}
