import 'package:flutter/material.dart';
import 'package:halkculator/features/saved/saved_page.dart';
import 'package:halkculator/features/settings/settings_page.dart';
import 'package:halkculator/features/share_calculate/share_calculate_page.dart';
import 'package:halkculator/screens/dashboard/dashboard_manager.dart';
import 'package:halkculator/shareds/widget/layout/dashboard_layout.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget itemBuilder(int index) {
    if (index == 0) {
      return const ShareCalculateScreen();
    } else if (index == 1) {
      return const SavedPage();
    } else if (index == 2) {
      return const SettingsPage();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    int index = DashboardCountManager.watchCount(context: context);

    return DashboardLayout(
      index: index,
      onChanged: (newIndex) {
        DashboardCountManager.setCount(count: newIndex, context: context);
      },
      body: itemBuilder(index),
    );
  }
}
