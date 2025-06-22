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

  @override
  String get plantAppPremium => '%%PlantAPP%% Premium';

  @override
  String get accessAllFeatures => 'Access All Features';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get plantIdentify => 'Plant Identify';

  @override
  String get faster => 'Faster';

  @override
  String get process => 'Process';

  @override
  String get month => 'Month';

  @override
  String get year => 'Year';

  @override
  String get subscription_monthly_auto_renew => '\$2.99/month, auto renewable';

  @override
  String get subscription_trial_then_yearly_price => 'First 3 days free, then \$529.99/year';

  @override
  String get trial_try_free => 'Try free for 3 days';

  @override
  String get trial_description => 'After the 3-day free trial period you\'ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable.';

  @override
  String get terms => 'Terms';

  @override
  String get privacy => 'Privacy';

  @override
  String get restore => 'Restore';

  @override
  String get save => 'Save';

  @override
  String get hiPlantLover => 'Hi, plant lover!';

  @override
  String get goodAfternoon => 'Good Afternoon! ⛅';

  @override
  String get categoriesLoading => 'Categories loading...';

  @override
  String get dataLoading => 'Data loading...';

  @override
  String get questionsLoading => 'Questions loading...';

  @override
  String get tryAgain => 'Try Again';

  @override
  String categoriesAndQuestionsError(String message) {
    return 'Error loading categories and questions: $message';
  }

  @override
  String categoriesError(String message) {
    return 'Error loading categories: $message';
  }

  @override
  String questionsError(String message) {
    return 'Error loading questions: $message';
  }

  @override
  String unexpectedError(String message) {
    return 'An unexpected error occurred: $message';
  }

  @override
  String get premium => 'FREE Premium Available';

  @override
  String get upgrade => 'Tap to upgrade your account!';

  @override
  String get featureUnlimitedPlantIdentify => 'Unlimited Plant Identify';

  @override
  String get featureFasterProcess => 'Faster Process';

  @override
  String get featureUnlimited => 'Unlimited';

  @override
  String subscriptionMonthlyPrice(String price) {
    return '$price/month, auto renewable';
  }

  @override
  String subscriptionYearlyPrice(String price) {
    return 'First 3 days free, then $price/year';
  }

  @override
  String tryFreeForDays(int days) {
    return 'Try free for $days days';
  }

  @override
  String trialDescription(int days, String price) {
    return 'After the $days-day free trial period you\'ll be charged $price per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable.';
  }

  @override
  String termsAndPrivacyAndRestore(String terms, String privacy, String restore) {
    return '$terms  •  $privacy  •  $restore';
  }

  @override
  String get searchForPlants => 'Search for plants';

  @override
  String get loadingData => 'Loading data...';

  @override
  String get startingUp => 'Starting up...';

  @override
  String get verifyingData => 'Verifying data...';
}
