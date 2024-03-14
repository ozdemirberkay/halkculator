import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/shareds/widget/database/share/clear_share_button.dart';
import 'package:halkculator/shareds/widget/layout/layout.dart';
import 'package:halkculator/shareds/widget/theme/theme_changer_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        body: Padding(
      padding: EdgeInsets.all(AppConstants.highMargin),
      child: Column(
        children: [
          const ThemeChangerButton(),
          SizedBox(height: AppConstants.highMargin),
          const ClearShareButton(),
        ],
      ),
    ));
  }
}
