import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/features/saved/saved_share_card.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:halkculator/shareds/ad/ads_manager.dart';
import 'package:halkculator/shareds/database/share_database.dart';
import 'package:halkculator/shareds/widget/layout/layout.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    ShareDatabase.instance.watchBox(context: context);
    List<Share> shareList = ShareDatabase.instance.getAllShares();

    return ValueListenableBuilder<Box<Share>>(
        valueListenable: ShareDatabase.instance.shareBox.listenable(),
        builder: (context, box, widget) {
          return Layout(
              body: ListView.builder(
            itemCount: shareList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return BannerAdManager.instance.loadAndShowAd();
              }
              index = index - 1;
              return Padding(
                padding: EdgeInsets.all(AppConstants.lowMargin),
                child: SavedShareCard(
                  share: shareList[index],
                  index: index,
                ),
              );
            },
          ));
        });
  }
}
