import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:halkculator/shareds/widget/database/share/delete_share_button.dart';
import 'package:halkculator/shareds/widget/layout/card_layout.dart';

class SavedShareCard extends StatelessWidget {
  final Share share;
  final int index;
  const SavedShareCard({super.key, required this.share, required this.index});

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr("shareLot", namedArgs: {"lot": share.lot.toString()})),
              Text(tr("sharePrice",
                  namedArgs: {"price": share.price.toString()})),
            ],
          ),
          DeleteShareButton(
            index: index,
          ),
        ],
      ),
    );
  }
}
