// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Halkculator';

  @override
  String get navCalculator => 'Anasayfa';

  @override
  String get navSaved => 'Kaydedilenler';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get priceLabel => 'Fiyat';

  @override
  String get quantityLabel => 'Adet';

  @override
  String get calculateButton => 'Hesapla';

  @override
  String get saveTooltip => 'Kaydet';

  @override
  String get savedMessage => 'Hesaplama kaydedildi';

  @override
  String get ceilingTab => 'Tavan';

  @override
  String get floorTab => 'Taban';

  @override
  String ceilingDay(int day) {
    return '$day. Tavan';
  }

  @override
  String floorDay(int day) {
    return '$day. Taban';
  }

  @override
  String sharePrice(double price) {
    final intl.NumberFormat priceNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String priceString = priceNumberFormat.format(price);

    return 'Hisse Fiyatı: $priceString';
  }

  @override
  String shareQuantity(int quantity) {
    final intl.NumberFormat quantityNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String quantityString = quantityNumberFormat.format(quantity);

    return 'Hisse Adeti: $quantityString';
  }

  @override
  String totalValue(double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Toplam Hisse Değeri: $valueString';
  }

  @override
  String changePercent(String sign, double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String valueString = valueNumberFormat.format(value);

    return '$sign%$valueString';
  }

  @override
  String profitAmount(String sign, double amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String amountString = amountNumberFormat.format(amount);

    return '$sign$amountString TL';
  }

  @override
  String get validationRequired => 'Bir değer girin';

  @override
  String get validationInvalid => 'Geçerli bir değer girin';

  @override
  String get validationNotPositive => 'Sıfırdan büyük bir değer girin';

  @override
  String get validationTooLarge => 'Daha küçük bir değer girin';

  @override
  String get savedEmpty => 'Henüz kaydedilmiş bir hesaplama yok';

  @override
  String get deleteTooltip => 'Sil';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Aydınlık';

  @override
  String get themeDark => 'Karanlık';

  @override
  String get clearSavedTitle => 'Kaydedilenleri Temizle';

  @override
  String get clearButton => 'Temizle';

  @override
  String get clearSavedConfirm =>
      'Kaydedilen tüm hesaplamalar silinecek. Emin misiniz?';

  @override
  String get cancelButton => 'Vazgeç';
}
