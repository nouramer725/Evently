import 'package:evently_app/home/tabs/home/AppBarWidget%201/app_bar_widget1.dart';
import 'package:evently_app/home/tabs/home/AppBarWidget%202/app_bar_widget2.dart';
import 'package:evently_app/home/tabs/home/body_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<AppFirebaseProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    if (eventProvider.eventList.isEmpty) {
      eventProvider.getAllDataFromFireBase();
    }
    return Scaffold(
      appBar: AppBarWidget1(),
      // appBar: AppBarWidget2(),
      body: eventProvider.filterList.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.no_events_found,
                style: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: 20,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return BodyWidget(event: eventProvider.filterList[index]);
              },
              itemCount: eventProvider.filterList.length,

              separatorBuilder: (context, index) {
                return SizedBox(height: h(15));
              },
            ),
    );
  }
}
