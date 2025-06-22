import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'HubX Example'**
  String get appTitle;

  /// No description provided for @welcomeToPlantApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to %%PlantApp%%'**
  String get welcomeToPlantApp;

  /// No description provided for @identifyPlantsDescription.
  ///
  /// In en, this message translates to:
  /// **'Identify more than 3000+ plants and 88% accuracy.'**
  String get identifyPlantsDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @termsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'By tapping next, you are agreeing to PlantID %%Terms of Use%% & %%Privacy Policy%%.'**
  String get termsAndPrivacy;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @takePhoneIdentify.
  ///
  /// In en, this message translates to:
  /// **'Take a photo to %%identify%% the plant!'**
  String get takePhoneIdentify;

  /// No description provided for @getPlantCareGuides.
  ///
  /// In en, this message translates to:
  /// **'Get plant %%care guides%%'**
  String get getPlantCareGuides;

  /// No description provided for @plantAppPremium.
  ///
  /// In en, this message translates to:
  /// **'%%PlantAPP%% Premium'**
  String get plantAppPremium;

  /// No description provided for @accessAllFeatures.
  ///
  /// In en, this message translates to:
  /// **'Access All Features'**
  String get accessAllFeatures;

  /// No description provided for @unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimited;

  /// No description provided for @plantIdentify.
  ///
  /// In en, this message translates to:
  /// **'Plant Identify'**
  String get plantIdentify;

  /// No description provided for @faster.
  ///
  /// In en, this message translates to:
  /// **'Faster'**
  String get faster;

  /// No description provided for @process.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get process;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @subscription_monthly_auto_renew.
  ///
  /// In en, this message translates to:
  /// **'\$2.99/month, auto renewable'**
  String get subscription_monthly_auto_renew;

  /// No description provided for @subscription_trial_then_yearly_price.
  ///
  /// In en, this message translates to:
  /// **'First 3 days free, then \$529.99/year'**
  String get subscription_trial_then_yearly_price;

  /// No description provided for @trial_try_free.
  ///
  /// In en, this message translates to:
  /// **'Try free for 3 days'**
  String get trial_try_free;

  /// No description provided for @trial_description.
  ///
  /// In en, this message translates to:
  /// **'After the 3-day free trial period you\'ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable.'**
  String get trial_description;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get terms;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @hiPlantLover.
  ///
  /// In en, this message translates to:
  /// **'Hi, plant lover!'**
  String get hiPlantLover;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon! ⛅'**
  String get goodAfternoon;

  /// No description provided for @categoriesLoading.
  ///
  /// In en, this message translates to:
  /// **'Categories loading...'**
  String get categoriesLoading;

  /// No description provided for @dataLoading.
  ///
  /// In en, this message translates to:
  /// **'Data loading...'**
  String get dataLoading;

  /// No description provided for @questionsLoading.
  ///
  /// In en, this message translates to:
  /// **'Questions loading...'**
  String get questionsLoading;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @categoriesAndQuestionsError.
  ///
  /// In en, this message translates to:
  /// **'Error loading categories and questions: {message}'**
  String categoriesAndQuestionsError(String message);

  /// No description provided for @categoriesError.
  ///
  /// In en, this message translates to:
  /// **'Error loading categories: {message}'**
  String categoriesError(String message);

  /// No description provided for @questionsError.
  ///
  /// In en, this message translates to:
  /// **'Error loading questions: {message}'**
  String questionsError(String message);

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred: {message}'**
  String unexpectedError(String message);

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'FREE Premium Available'**
  String get premium;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Tap to upgrade your account!'**
  String get upgrade;

  /// No description provided for @featureUnlimitedPlantIdentify.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Plant Identify'**
  String get featureUnlimitedPlantIdentify;

  /// No description provided for @featureFasterProcess.
  ///
  /// In en, this message translates to:
  /// **'Faster Process'**
  String get featureFasterProcess;

  /// No description provided for @featureUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get featureUnlimited;

  /// No description provided for @subscriptionMonthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/month, auto renewable'**
  String subscriptionMonthlyPrice(String price);

  /// No description provided for @subscriptionYearlyPrice.
  ///
  /// In en, this message translates to:
  /// **'First 3 days free, then {price}/year'**
  String subscriptionYearlyPrice(String price);

  /// No description provided for @tryFreeForDays.
  ///
  /// In en, this message translates to:
  /// **'Try free for {days} days'**
  String tryFreeForDays(int days);

  /// No description provided for @trialDescription.
  ///
  /// In en, this message translates to:
  /// **'After the {days}-day free trial period you\'ll be charged {price} per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable.'**
  String trialDescription(int days, String price);

  /// No description provided for @termsAndPrivacyAndRestore.
  ///
  /// In en, this message translates to:
  /// **'{terms}  •  {privacy}  •  {restore}'**
  String termsAndPrivacyAndRestore(String terms, String privacy, String restore);

  /// No description provided for @searchForPlants.
  ///
  /// In en, this message translates to:
  /// **'Search for plants'**
  String get searchForPlants;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
