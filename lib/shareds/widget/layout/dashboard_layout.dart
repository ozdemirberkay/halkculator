import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget body;
  final int index;
  final Function(int) onChanged;

  const DashboardLayout({
    required this.body,
    required this.index,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.calculate),
          label: tr("homePage"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.save),
          label: tr("saved"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: tr("settings"),
        ),
      ], currentIndex: index, onTap: onChanged),
      body: body,
    );
  }
}
