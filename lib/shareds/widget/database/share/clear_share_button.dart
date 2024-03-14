import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halkculator/shareds/database/share_database.dart';
import 'package:halkculator/shareds/widget/button/primary_button.dart';
import 'package:halkculator/shareds/widget/layout/card_layout.dart';

class ClearShareButton extends StatelessWidget {
  const ClearShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(tr("clearSaved")),
          const SizedBox(height: 5),
          PrimaryButton(
            label: tr("clear"),
            onPressed: () {
              ShareDatabase.instance.clear();
            },
          ),
        ],
      ),
    );
  }
}
