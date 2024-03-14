import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/database_configs.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'share_model.g.dart';

@HiveType(typeId: DatabaseConfigs.shareHiveTypeId)
class Share with ChangeNotifier {
  @HiveField(0)
  double price;

  @HiveField(1)
  int lot;

  Share({required this.price, required this.lot});

  void setLotAndPrice({required int lot, required double price}) {
    this.lot = lot;
    this.price = price;
    notifyListeners();
  }
}
