import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:halkculator/app.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/data/stock_position.dart';
import 'package:halkculator/core/theme/theme_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StockPositionAdapter());

  final (savedPositions, themeController) = await (
    SavedPositionsRepository.open(),
    ThemeController.load(),
  ).wait;

  unawaited(MobileAds.instance.initialize());

  runApp(
    HalkculatorApp(
      savedPositions: savedPositions,
      themeController: themeController,
    ),
  );
}
