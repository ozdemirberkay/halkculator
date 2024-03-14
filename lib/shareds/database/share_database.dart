import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/database_configs.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ShareDatabase with ChangeNotifier {
  static final ShareDatabase _instance = ShareDatabase._internal();
  static ShareDatabase get instance => _instance;
  ShareDatabase._internal();

  late Box<Share> shareBox;

  Box<Share> watchBox({required BuildContext context}) {
    return context.watch<ShareDatabase>().shareBox;
  }

  Future<void> openBox() async {
    shareBox = await Hive.openBox<Share>(DatabaseConfigs.shareBoxName);
  }

  Future<void> addShare(Share share) async {
    Uuid key = const Uuid();
    shareBox.put(key.v1(), share);
    notifyListeners();
  }

  List<Share> getAllShares() {
    return shareBox.values.toList();
  }

  Future<void> updateShare(int index, Share newShare) async {
    await shareBox.putAt(index, newShare);
    notifyListeners();
  }

  Future<void> deleteShare(int index) async {
    await shareBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> clear() async {
    await shareBox.clear();
    notifyListeners();
  }
}
