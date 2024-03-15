import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/theme_provider.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:halkculator/screens/dashboard/dashboard_manager.dart';
import 'package:halkculator/screens/dashboard/dashboard_screen.dart';
import 'package:halkculator/config/constants/app_assets.dart';
import 'package:halkculator/config/locale/locale.dart';
import 'package:halkculator/config/theme/app_theme.dart';
import 'package:halkculator/shareds/database/share_database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(ShareAdapter());

  await EasyLocalization.ensureInitialized();
  ShareDatabase.instance.openBox();

  ThemeMode initialTheme = await ThemeManager.readTheme();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: AppAssets.translations,
      fallbackLocale: AppLocale.fallbackLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<Share>(
            create: (BuildContext context) {
              return Share(lot: 0, price: 0);
            },
          ),
          ChangeNotifierProvider<DashboardCount>(
            create: (BuildContext context) {
              return DashboardCount(count: 0);
            },
          ),
          ChangeNotifierProvider<ShareDatabase>(
            create: (BuildContext context) {
              return ShareDatabase.instance;
            },
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(currentTheme: initialTheme),
          ),
        ],
        child: const HalkculatorApp(),
      ),
    ),
  );
}

class HalkculatorApp extends StatelessWidget {
  const HalkculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeProvider.currentTheme,
          home: const DashboardScreen(),
        );
      },
    );
  }
}
