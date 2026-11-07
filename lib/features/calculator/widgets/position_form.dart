import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halkculator/core/data/stock_position.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/widgets/app_card.dart';
import 'package:halkculator/features/calculator/position_input.dart';
import 'package:halkculator/l10n/app_localizations.dart';

/// Price and quantity inputs. Reports a valid [StockPosition] on submit.
class PositionForm extends StatefulWidget {
  const PositionForm({super.key, required this.onSubmitted});

  final ValueChanged<StockPosition> onSubmitted;

  @override
  State<PositionForm> createState() => _PositionFormState();
}

class _PositionFormState extends State<PositionForm> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    FocusScope.of(context).unfocus();
    widget.onSubmitted(
      StockPosition(
        price: parsePrice(_priceController.text)!,
        quantity: parseQuantity(_quantityController.text)!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: l10n.priceLabel),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              textInputAction: TextInputAction.next,
              validator: (value) => validatePrice(value)?.message(l10n),
            ),
            const SizedBox(height: AppSizes.spacingSmall),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: l10n.quantityLabel),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: (value) => validateQuantity(value)?.message(l10n),
            ),
            const SizedBox(height: AppSizes.spacingSmall),
            ElevatedButton(
              onPressed: _submit,
              child: Text(l10n.calculateButton),
            ),
          ],
        ),
      ),
    );
  }
}

extension on InputError {
  String message(AppLocalizations l10n) => switch (this) {
    InputError.required => l10n.validationRequired,
    InputError.invalid => l10n.validationInvalid,
    InputError.notPositive => l10n.validationNotPositive,
    InputError.tooLarge => l10n.validationTooLarge,
  };
}
