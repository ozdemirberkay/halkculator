import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('tr')];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Halkculator'**
  String get appTitle;

  /// No description provided for @navCalculator.
  ///
  /// In tr, this message translates to:
  /// **'Anasayfa'**
  String get navCalculator;

  /// No description provided for @navSaved.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedilenler'**
  String get navSaved;

  /// No description provided for @navSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get navSettings;

  /// No description provided for @priceLabel.
  ///
  /// In tr, this message translates to:
  /// **'Fiyat'**
  String get priceLabel;

  /// No description provided for @quantityLabel.
  ///
  /// In tr, this message translates to:
  /// **'Adet'**
  String get quantityLabel;

  /// No description provided for @calculateButton.
  ///
  /// In tr, this message translates to:
  /// **'Hesapla'**
  String get calculateButton;

  /// No description provided for @saveTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get saveTooltip;

  /// No description provided for @savedMessage.
  ///
  /// In tr, this message translates to:
  /// **'Hesaplama kaydedildi'**
  String get savedMessage;

  /// No description provided for @ceilingTab.
  ///
  /// In tr, this message translates to:
  /// **'Tavan'**
  String get ceilingTab;

  /// No description provided for @floorTab.
  ///
  /// In tr, this message translates to:
  /// **'Taban'**
  String get floorTab;

  /// No description provided for @ceilingDay.
  ///
  /// In tr, this message translates to:
  /// **'{day}. Tavan'**
  String ceilingDay(int day);

  /// No description provided for @floorDay.
  ///
  /// In tr, this message translates to:
  /// **'{day}. Taban'**
  String floorDay(int day);

  /// No description provided for @sharePrice.
  ///
  /// In tr, this message translates to:
  /// **'Hisse Fiyatı: {price}'**
  String sharePrice(double price);

  /// No description provided for @shareQuantity.
  ///
  /// In tr, this message translates to:
  /// **'Hisse Adeti: {quantity}'**
  String shareQuantity(int quantity);

  /// No description provided for @totalValue.
  ///
  /// In tr, this message translates to:
  /// **'Toplam Hisse Değeri: {value}'**
  String totalValue(double value);

  /// No description provided for @changePercent.
  ///
  /// In tr, this message translates to:
  /// **'{sign}%{value}'**
  String changePercent(String sign, double value);

  /// No description provided for @profitAmount.
  ///
  /// In tr, this message translates to:
  /// **'{sign}{amount} TL'**
  String profitAmount(String sign, double amount);

  /// No description provided for @validationRequired.
  ///
  /// In tr, this message translates to:
  /// **'Bir değer girin'**
  String get validationRequired;

  /// No description provided for @validationInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir değer girin'**
  String get validationInvalid;

  /// No description provided for @validationNotPositive.
  ///
  /// In tr, this message translates to:
  /// **'Sıfırdan büyük bir değer girin'**
  String get validationNotPositive;

  /// No description provided for @validationTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'Daha küçük bir değer girin'**
  String get validationTooLarge;

  /// No description provided for @savedEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kaydedilmiş bir hesaplama yok'**
  String get savedEmpty;

  /// No description provided for @deleteTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get deleteTooltip;

  /// No description provided for @themeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tema'**
  String get themeTitle;

  /// No description provided for @themeSystem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In tr, this message translates to:
  /// **'Aydınlık'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In tr, this message translates to:
  /// **'Karanlık'**
  String get themeDark;

  /// No description provided for @clearSavedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedilenleri Temizle'**
  String get clearSavedTitle;

  /// No description provided for @clearButton.
  ///
  /// In tr, this message translates to:
  /// **'Temizle'**
  String get clearButton;

  /// No description provided for @clearSavedConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedilen tüm hesaplamalar silinecek. Emin misiniz?'**
  String get clearSavedConfirm;

  /// No description provided for @cancelButton.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get cancelButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
