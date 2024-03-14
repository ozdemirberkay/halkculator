import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_manager.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/shareds/validator/input_validator.dart';
import 'package:halkculator/shareds/widget/button/primary_button.dart';
import 'package:halkculator/shareds/widget/input/input_field.dart';
import 'package:halkculator/shareds/widget/layout/card_layout.dart';

class ShareInputCard extends StatefulWidget {
  const ShareInputCard({super.key});

  @override
  State<ShareInputCard> createState() => _ShareInputCardState();
}

TextEditingController _priceController = TextEditingController();
TextEditingController _lotController = TextEditingController();
var _formKey = GlobalKey<FormState>();

void onCalculated({required BuildContext context}) {
  int? lot = int.tryParse(_lotController.text) ?? 0;
  double? price = double.tryParse(_priceController.text) ?? 0;

  ShareCalculateManager.setLotAndPrice(
      context: context, lot: lot, price: price);
}

class _ShareInputCardState extends State<ShareInputCard> {
  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              label: tr("price"),
              controller: _priceController,
              validator: InputValidator.priceValidator,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: AppConstants.lowMargin),
            InputField(
              label: tr("lot"),
              controller: _lotController,
              validator: InputValidator.lotValidator,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: AppConstants.lowMargin),
            PrimaryButton(
              label: tr("calculate"),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  onCalculated(context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
