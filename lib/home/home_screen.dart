import 'package:evently_app/home/tabs/favorite/favourite_tab_screen.dart';
import 'package:evently_app/home/tabs/home/home_tab_screen.dart';
import 'package:evently_app/home/tabs/profile/profile_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_theme_provider.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeTabScreen(),
    FavouriteTabScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addEventScreenName);
        },
        child: Icon(Icons.add, color: AppColors.inputsColorLight),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          buildBottomNavigationBarItem(
            index: 0,
            label: AppLocalizations.of(context)!.home,
            outlinedIcon: AppAssets.homeIconUnSelected,
            filledIcon: themeProvider.isDarkTheme()
                ? AppAssets.homeIconSelectedDark
                : AppAssets.homeIconSelected,
          ),
          buildBottomNavigationBarItem(
            index: 1,
            label: AppLocalizations.of(context)!.favorite,
            outlinedIcon: AppAssets.favouriteIconUnSelected,
            filledIcon: themeProvider.isDarkTheme()
                ? AppAssets.favouriteIconSelectedDark
                : AppAssets.favouriteIconSelected,
          ),
          buildBottomNavigationBarItem(
            index: 2,
            label: AppLocalizations.of(context)!.profile,
            outlinedIcon: AppAssets.profileIconUnSelected,
            filledIcon: themeProvider.isDarkTheme()
                ? AppAssets.profileIconSelectedDark
                : AppAssets.profileIconSelected,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: screens[selectedIndex])]),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required int index,
    required String label,
    required String outlinedIcon,
    required String filledIcon,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(selectedIndex == index ? filledIcon : outlinedIcon),
    );
  }
}
