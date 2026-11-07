/// Parsing and validation of the calculator's form fields.
library;

const double maxPrice = 100000;
const int maxQuantity = 1000000;

enum InputError { required, invalid, notPositive, tooLarge }

/// Parses a price typed with either a comma or a dot as decimal separator.
double? parsePrice(String? input) =>
    double.tryParse((input ?? '').trim().replaceAll(',', '.'));

int? parseQuantity(String? input) => int.tryParse((input ?? '').trim());

InputError? validatePrice(String? input) =>
    _validate(input, parsePrice(input), maxPrice);

InputError? validateQuantity(String? input) =>
    _validate(input, parseQuantity(input), maxQuantity);

InputError? _validate(String? input, num? value, num max) {
  if (input == null || input.trim().isEmpty) return InputError.required;
  if (value == null || !value.isFinite) return InputError.invalid;
  if (value <= 0) return InputError.notPositive;
  if (value > max) return InputError.tooLarge;
  return null;
}
