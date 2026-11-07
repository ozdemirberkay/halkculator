# Halkculator

A small Flutter app that shows how a Borsa İstanbul position would change
after consecutive **ceiling** (tavan, +10%) or **floor** (taban, −10%) days.

Enter the purchase price and the number of shares, and the app lists the
share price, total value and profit or loss for each of the next 50 limit
days. Calculations can be saved for later.

<p align="left">
  <img src="https://github.com/ozdemirberkay/halkculator/assets/55758394/b3eeae40-989b-4a05-a8e2-84987ae9f914" width="150" />
  <img src="https://github.com/ozdemirberkay/halkculator/assets/55758394/7ba0fd4a-92a0-4125-9800-bc13b34449ae" width="150" />
  <img src="https://github.com/ozdemirberkay/halkculator/assets/55758394/324b8680-9d1a-4939-9cc3-799e627864b6" width="150" />
  <img src="https://github.com/ozdemirberkay/halkculator/assets/55758394/12d06de6-74c5-4a5a-8fa3-2853781161e3" width="150" />
  <img src="https://github.com/ozdemirberkay/halkculator/assets/55758394/7ac6fe1a-3cd6-449e-8260-4a15f95dc3f1" width="150" />
</p>

## Running

Built and tested with Flutter 3.47 (Dart 3.13).

```bash
flutter pub get
flutter run
```

### Android release signing

Create `android/key.properties` (git-ignored):

```properties
storeFile=/path/to/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

Without this file, release builds are signed with the debug key.

## Project structure

```
lib/
├── main.dart                 # Opens local storage, then runs the app
├── app.dart                  # MaterialApp, themes and localization
├── core/
│   ├── constants/            # Asset paths
│   ├── data/                 # StockPosition model and saved positions storage
│   ├── theme/                # Colors, sizes, ThemeData and theme mode controller
│   └── widgets/              # Shared widgets
├── features/
│   ├── calculator/           # Limit calculation and the calculator screen
│   ├── home/                 # Bottom navigation shell
│   ├── saved/                # Saved calculations
│   └── settings/             # Theme selection and clearing saved data
└── l10n/                     # ARB strings and generated localizations
```

## Tech

- [hive_ce](https://pub.dev/packages/hive_ce) for local storage
- [lottie](https://pub.dev/packages/lottie) for the empty-state animation
- Flutter's built-in `gen-l10n` for localization (`lib/l10n/app_tr.arb`)
