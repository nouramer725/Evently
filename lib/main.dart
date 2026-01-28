import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/provider/app_firebase_provider.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/provider/shared_preferences_language.dart';
import 'package:evently_app/provider/shared_preferences_theme.dart';
import 'package:evently_app/startScreen/start_screen.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:evently_app/utils/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home/AddEvent/add_event_screen.dart';
import 'home/home_screen.dart';
import 'l10n/app_localizations.dart';
import 'login_register_Screens/forget_password/forget_password_screen.dart';
import 'login_register_Screens/login/login_screen.dart';
import 'login_register_Screens/register/register_screen.dart';
import 'onBoarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();

  ///offline
  await SharedPreferencesLanguage.init();
  await SharedPreferencesTheme.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ChangeNotifierProvider(create: (_) => AppFirebaseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    SizeConfig.init(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      locale: Locale(languageProvider.appLocal),
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.startScreenName,
      routes: {
        AppRoutes.startScreenName: (context) => StartScreen(),
        AppRoutes.onBoardingScreenName: (context) => OnboardingScreen(),
        AppRoutes.loginScreenName: (context) => LoginScreen(),
        AppRoutes.registerScreenName: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordScreenName: (context) => ForgetPasswordScreen(),
        AppRoutes.homeScreenName: (context) => HomeScreen(),
        AppRoutes.addEventScreenName: (context) => AddEventScreen(),
      },
    );
  }
}
