import 'package:easy_localization/easy_localization.dart';

class InputValidator {
  static String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return tr("enteraValue");
    } else {
      String editedText = value.replaceAll(',', '.');
      double? result = double.tryParse(editedText);
      if (result == null) {
        return tr("enteraValidValue");
      } else if (result > 100000) {
        return tr("enterASmallerValue");
      }
    }
    return null;
  }

  static String? lotValidator(String? value) {
    if (value == null || value.isEmpty) {
      return tr("enteraValue");
    } else {
      int? result = int.tryParse(value);
      if (result == null) {
        return tr("enteraValidValue");
      } else if (result > 1000000) {
        return tr("enterASmallerValue");
      }
    }
    return null;
  }
}
