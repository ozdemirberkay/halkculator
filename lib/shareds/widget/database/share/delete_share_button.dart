import 'package:flutter/material.dart';
import 'package:halkculator/shareds/database/share_database.dart';
import 'package:halkculator/shareds/widget/button/primary_icon_button.dart';

class DeleteShareButton extends StatelessWidget {
  final int index;
  const DeleteShareButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return PrimaryIconButton(
      onPressed: () {
        ShareDatabase.instance.deleteShare(index);
      },
      iconData: Icons.delete_forever,
    );
  }
}
