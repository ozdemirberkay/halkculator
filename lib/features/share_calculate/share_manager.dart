import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:provider/provider.dart';

class ShareCalculateManager {
  static Share watchShare({required BuildContext context}) {
    return context.watch<Share>();
  }

  static Share readShare({required BuildContext context}) {
    return context.read<Share>();
  }

  static void setLotAndPrice(
      {required BuildContext context,
      required int lot,
      required double price}) {
    Provider.of<Share>(context, listen: false)
        .setLotAndPrice(lot: lot, price: price);
  }
}
