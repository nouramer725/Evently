import 'package:evently_app/home/tabs/profile/selected_row_widget.dart';
import 'package:evently_app/home/tabs/profile/un_selected_row_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_language_provider.dart';

class BottonSheetComponent extends StatelessWidget {
  const BottonSheetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
      child: Column(
        spacing: h(20),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLocal == 'ar'
                ? SelectedRowWidget(text: AppLocalizations.of(context)!.arabic)
                : UnSelectedRowWidget(
                    text: AppLocalizations.of(context)!.arabic,
                  ),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLocal == 'en'
                ? SelectedRowWidget(text: AppLocalizations.of(context)!.english)
                : UnSelectedRowWidget(
                    text: AppLocalizations.of(context)!.english,
                  ),
          ),
        ],
      ),
    );
  }
}
