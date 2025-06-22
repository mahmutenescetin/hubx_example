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

  @override
  String get getPlantCareGuides => 'Bitki %%Bakım Kılavuzlarını%% edinin';

  @override
  String get plantAppPremium => '%%PlantAPP%% Premium';

  @override
  String get accessAllFeatures => 'Tüm Özelliklere Erişim';

  @override
  String get unlimited => 'Limitsiz';

  @override
  String get plantIdentify => 'Bitki Tanımlama';

  @override
  String get faster => 'Daha hızlı';

  @override
  String get process => 'İşlem';

  @override
  String get month => 'Ay';

  @override
  String get year => 'Yıl';

  @override
  String get subscription_monthly_auto_renew => '\$2.99/ay, otomatik yenilenir';

  @override
  String get subscription_trial_then_yearly_price => 'İlk 3 gün ücretsiz, ardından yıllık 529,9\$/yıl';

  @override
  String get trial_try_free => '3 gün ücretsiz dene';

  @override
  String get trial_description => '3 günlük deneme süresi sona erdikten sonra iptal etmediğiniz sürece yıllık ₺274.99 ücret alınır. Yıllık abonelik otomatik olarak yenilenir.';

  @override
  String get terms => 'Şartlar';

  @override
  String get privacy => 'Gizlilik';

  @override
  String get restore => 'Satın alım geri yükleme';

  @override
  String get save => 'İndirim';

  @override
  String get hiPlantLover => 'Merhaba, bitki sever!';

  @override
  String get goodAfternoon => 'İyi Öğleden Sonra! ⛅';

  @override
  String get categoriesLoading => 'Kategoriler yükleniyor...';

  @override
  String get dataLoading => 'Veriler yükleniyor...';

  @override
  String get questionsLoading => 'Sorular yükleniyor...';

  @override
  String get tryAgain => 'Tekrar Dene';

  @override
  String categoriesAndQuestionsError(String message) {
    return 'Kategoriler ve Sorular yüklenirken hata oluştu: $message';
  }

  @override
  String categoriesError(String message) {
    return 'Kategoriler yüklenirken hata oluştu: $message';
  }

  @override
  String questionsError(String message) {
    return 'Sorular yüklenirken hata oluştu: $message';
  }

  @override
  String unexpectedError(String message) {
    return 'Beklenmeyen bir hata oluştu: $message';
  }

  @override
  String get premium => 'ÜCRETSİZ Premium Mevcut';

  @override
  String get upgrade => 'Hesabınızı yükseltmek için dokunun!';

  @override
  String get featureUnlimitedPlantIdentify => 'Limitsiz Bitki Tanımlama';

  @override
  String get featureFasterProcess => 'Daha Hızlı İşlem';

  @override
  String get featureUnlimited => 'Limitsiz';

  @override
  String subscriptionMonthlyPrice(String price) {
    return '$price/ay, otomatik yenilenir';
  }

  @override
  String subscriptionYearlyPrice(String price) {
    return 'İlk 3 gün ücretsiz, ardından $price/yıl';
  }

  @override
  String tryFreeForDays(int days) {
    return '$days gün ücretsiz dene';
  }

  @override
  String trialDescription(int days, String price) {
    return '$days günlük deneme süresi sona erdikten sonra iptal etmediğiniz sürece yıllık $price ücret alınır. Yıllık abonelik otomatik olarak yenilenir.';
  }

  @override
  String termsAndPrivacyAndRestore(String terms, String privacy, String restore) {
    return '$terms  •  $privacy  •  $restore';
  }

  @override
  String get searchForPlants => 'Bitki ara';

  @override
  String get loadingData => 'Veriler yükleniyor...';

  @override
  String get startingUp => 'Başlatılıyor...';

  @override
  String get verifyingData => 'Veriler doğrulanıyor...';

  @override
  String get navBarHome => 'Anasayfa';

  @override
  String get navBarDiagnose => 'Teşhis';

  @override
  String get navBarMyGarden => 'Bahçem';

  @override
  String get navBarProfile => 'Profil';
}
