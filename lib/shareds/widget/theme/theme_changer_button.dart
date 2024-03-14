import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/app_colors.dart';
import 'package:halkculator/config/theme/theme_provider.dart';
import 'package:halkculator/shareds/widget/layout/card_layout.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<(ThemeMode, String)> themeModes = <(ThemeMode, String)>[
      (ThemeMode.system, tr("system")),
      (ThemeMode.dark, tr("dark")),
      (ThemeMode.light, tr("light")),
    ];

    ThemeMode actual = ThemeManager.watchTheme(context: context).currentTheme;
    List<bool> selectedTheme = themeModes.map((e) => e.$1 == actual).toList();

    return CardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(tr("changeTheme")),
          const SizedBox(height: 5),
          ToggleButtons(
              onPressed: (int index) {
                ThemeManager.setTheme(
                    context: context, newTheme: themeModes[index].$1);
              },
              borderRadius: BorderRadius.all(AppConstants.radius),
              selectedBorderColor: AppColors.primaryColor,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 75.0,
              ),
              isSelected: selectedTheme,
              children: themeModes.map((e) => Text(e.$2)).toList()),
        ],
      ),
    );
  }
}
