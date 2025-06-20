// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'HubX Örnek';

  @override
  String get welcomeToPlantApp => 'PlantApp\'e %%Hoş Geldiniz%%';

  @override
  String get identifyPlantsDescription => '3000+ bitkiyi tanımlayın ve %88 doğruluk oranı.';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get termsAndPrivacy => 'İleri\'ye dokunarak PlantID %%Kullanım Şartları%% ve %%Gizlilik Politikası%%\'nı kabul etmiş olursunuz.';

  @override
  String get continueText => 'Devam Et';

  @override
  String get takePhoneIdentify => 'Bitkiyi %%tanımlamak%% için fotoğrafını çekin!';
}
