import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../provider/app_theme_provider.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/app_text.dart';
import '../utils/responsive.dart';
import '../utils/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    SizeConfig.init(context);

    final pages = [
      {
        "imageLight": AppAssets.onBoarding1,
        "imageDark": AppAssets.onBoarding1Dark,
        "title": AppLocalizations.of(context)!.title1,
        "text": AppLocalizations.of(context)!.text1,
      },
      {
        "imageLight": AppAssets.onBoarding2,
        "imageDark": AppAssets.onBoarding2Dark,
        "title": AppLocalizations.of(context)!.title2,
        "text": AppLocalizations.of(context)!.text2,
      },
      {
        "imageLight": AppAssets.onBoarding3,
        "imageDark": AppAssets.onBoarding3Dark,
        "title": AppLocalizations.of(context)!.title3,
        "text": AppLocalizations.of(context)!.text3,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: currentPage == 0
            ? const SizedBox()
            : InkWell(
                onTap: () => controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: w(5),
                    vertical: h(5),
                  ),
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
        title: Image.asset(
          themeProvider.isDarkTheme()
              ? AppAssets.eventlyLogoDark
              : AppAssets.eventlyLogo,
        ),
        actions: [
          currentPage == pages.length - 1
              ? const SizedBox()
              : TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.loginScreenName,
                  ),
                  child: Text(AppLocalizations.of(context)!.skip),
                ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => currentPage = i),
              itemBuilder: (context, index) {
                final page = pages[index];
                return buildPage(
                  themeProvider: themeProvider,
                  totalPages: pages.length,
                  imageLight: page["imageLight"]!,
                  imageDark: page["imageDark"]!,
                  title: page["title"]!,
                  text: page["text"]!,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(23)),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (currentPage == pages.length - 1) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginScreenName,
                    );
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: h(9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  currentPage == pages.length - 1
                      ? AppLocalizations.of(context)!.getstarted
                      : AppLocalizations.of(context)!.next,
                  style: AppText.mediumText(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String imageLight,
    required String imageDark,
    required String title,
    required String text,
    required int totalPages,
    required AppThemeProvider themeProvider,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(16)),
      child: SingleChildScrollView(
        child: Column(
          spacing: h(8),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              themeProvider.isDarkTheme() ? imageDark : imageLight,
              height: h(343),
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: currentPage == index ? 25 : 9,
                  height: 8,
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkTheme()
                        ? currentPage == index
                              ? AppColors.mainColorDark
                              : AppColors.mainTextColorDark
                        : currentPage == index
                        ? AppColors.mainColorLight
                        : AppColors.disableColorLight,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: themeProvider.isDarkTheme()
                  ? AppText.semiBoldText(color: AppColors.white, fontSize: 20)
                  : AppText.semiBoldText(
                      color: AppColors.mainTextColorLight,
                      fontSize: 20,
                    ),
            ),
            Text(
              text,
              style: themeProvider.isDarkTheme()
                  ? AppText.regularText(
                      color: AppColors.secTextColorDark,
                      fontSize: 16,
                    )
                  : AppText.regularText(
                      color: AppColors.secTextColorLight,
                      fontSize: 16,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
