import 'package:flutter/material.dart';
import 'package:halkculator/core/constants/app_assets.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/theme/theme_controller.dart';
import 'package:halkculator/features/calculator/calculator_page.dart';
import 'package:halkculator/features/saved/saved_page.dart';
import 'package:halkculator/features/settings/settings_page.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.savedPositions,
    required this.themeController,
  });

  final SavedPositionsRepository savedPositions;
  final ThemeController themeController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.logo, width: 48)),
      // IndexedStack keeps each tab's state (form input, scroll position)
      // while the user switches between tabs.
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          CalculatorPage(savedPositions: widget.savedPositions),
          SavedPage(savedPositions: widget.savedPositions),
          SettingsPage(
            themeController: widget.themeController,
            savedPositions: widget.savedPositions,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.calculate_outlined),
            selectedIcon: const Icon(Icons.calculate),
            label: l10n.navCalculator,
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmark_outline),
            selectedIcon: const Icon(Icons.bookmark),
            label: l10n.navSaved,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
