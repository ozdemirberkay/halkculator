import 'package:flutter/material.dart';
import 'package:halkculator/screens/dashboard/dashboard_screen.dart';

class AppRoutes {
  static String initialScreen = '/';

  static Map<String, WidgetBuilder> routes = {
    initialScreen: (context) => const DashboardScreen(),
  };
}
