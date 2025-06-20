// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HubX Example';

  @override
  String get welcomeToPlantApp => 'Welcome to %%PlantApp%%';

  @override
  String get identifyPlantsDescription => 'Identify more than 3000+ plants and 88% accuracy.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get termsAndPrivacy => 'By tapping next, you are agreeing to PlantID %%Terms of Use%% & %%Privacy Policy%%.';

  @override
  String get continueText => 'Continue';

  @override
  String get takePhoneIdentify => 'Take a photo to %%identify%% the plant!';

  @override
  String get getPlantCareGuides => 'Get plant %%care guides%%';
}
