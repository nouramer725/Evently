import 'package:evently_app/Models/event_model.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class BodyWidget extends StatelessWidget {
  final Event event;
  const BodyWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
      width: double.infinity,
      height: h(193),
      margin: EdgeInsets.symmetric(horizontal: w(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            event.eventImage
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: w(10), vertical: h(10)),
            padding: EdgeInsets.symmetric(horizontal: w(10), vertical: h(7)),
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
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat('d MMM').format(event.eventDate),
              style: AppText.semiBoldText(
                color: themeProvider.isDarkTheme()
                    ? AppColors.mainColorDark
                    : AppColors.mainColorLight,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: w(10), vertical: h(10)),
            padding: EdgeInsets.symmetric(horizontal: w(10)),
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
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  event.eventDescription,
                  style: AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: themeProvider.isDarkTheme()
                        ? AppColors.mainColorDark
                        : AppColors.mainColorLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
