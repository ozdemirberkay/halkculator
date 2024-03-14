import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_manager.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:halkculator/shareds/database/share_database.dart';

class SaveShareButton extends StatelessWidget {
  const SaveShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    Share share = ShareCalculateManager.watchShare(context: context);
    if (share.lot <= 0 || share.price <= 0) {
      return Container();
    }

    return FloatingActionButton(
      onPressed: () {
        Share share = ShareCalculateManager.readShare(context: context);

        ShareDatabase.instance
            .addShare(Share(price: share.price, lot: share.lot));
      },
      child: const Icon(Icons.save),
    );
  }
}
