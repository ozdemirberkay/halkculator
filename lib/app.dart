import 'package:flutter/material.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/theme/app_theme.dart';
import 'package:halkculator/core/theme/theme_controller.dart';
import 'package:halkculator/features/home/home_page.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class HalkculatorApp extends StatelessWidget {
  const HalkculatorApp({
    super.key,
    required this.savedPositions,
    required this.themeController,
  });

  final SavedPositionsRepository savedPositions;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, home) => MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.mode,
        home: home,
      ),
      child: HomePage(
        savedPositions: savedPositions,
        themeController: themeController,
      ),
    );
  }
}
