import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardCount with ChangeNotifier {
  late int count;

  void setCount({required int count}) {
    this.count = count;
    notifyListeners();
  }

  DashboardCount({required this.count});
}

class DashboardCountManager {
  static int watchCount({required BuildContext context}) {
    return context.watch<DashboardCount>().count;
  }

  static void setCount({required BuildContext context, required int count}) {
    Provider.of<DashboardCount>(context, listen: false).setCount(count: count);
  }
}
