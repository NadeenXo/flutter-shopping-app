import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Shopping App'**
  String get appTitle;

  /// No description provided for @firstProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'My First Project'**
  String get firstProjectTitle;

  /// No description provided for @twoImagesDisplayed.
  ///
  /// In en, this message translates to:
  /// **'The two images are displayed'**
  String get twoImagesDisplayed;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @firstLetterCapital.
  ///
  /// In en, this message translates to:
  /// **'First letter must be capital'**
  String get firstLetterCapital;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailMustContainAt.
  ///
  /// In en, this message translates to:
  /// **'Email must contain @'**
  String get emailMustContainAt;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @shopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get shopping;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get ourProducts;

  /// No description provided for @hotOffers.
  ///
  /// In en, this message translates to:
  /// **'Hot Offers'**
  String get hotOffers;

  /// No description provided for @product1.
  ///
  /// In en, this message translates to:
  /// **'Product 1'**
  String get product1;

  /// No description provided for @product2.
  ///
  /// In en, this message translates to:
  /// **'Product 2'**
  String get product2;

  /// No description provided for @product3.
  ///
  /// In en, this message translates to:
  /// **'Product 3'**
  String get product3;

  /// No description provided for @product4.
  ///
  /// In en, this message translates to:
  /// **'Product 4'**
  String get product4;

  /// No description provided for @product5.
  ///
  /// In en, this message translates to:
  /// **'Product 5'**
  String get product5;

  /// No description provided for @product6.
  ///
  /// In en, this message translates to:
  /// **'Product 6'**
  String get product6;

  /// No description provided for @hotOffer1.
  ///
  /// In en, this message translates to:
  /// **'Special Offer 1'**
  String get hotOffer1;

  /// No description provided for @hotOffer2.
  ///
  /// In en, this message translates to:
  /// **'Special Offer 2'**
  String get hotOffer2;

  /// No description provided for @hotOffer3.
  ///
  /// In en, this message translates to:
  /// **'Special Offer 3'**
  String get hotOffer3;

  /// No description provided for @hotOffer4.
  ///
  /// In en, this message translates to:
  /// **'Special Offer 4'**
  String get hotOffer4;

  /// No description provided for @hotOffer5.
  ///
  /// In en, this message translates to:
  /// **'Special Offer 5'**
  String get hotOffer5;

  /// No description provided for @itemAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to the cart'**
  String get itemAddedToCart;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @incorrectEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get incorrectEmailOrPassword;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @accountAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'An account already exists for this email'**
  String get accountAlreadyExists;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password is too weak'**
  String get weakPassword;

  /// No description provided for @myInformation.
  ///
  /// In en, this message translates to:
  /// **'My Information'**
  String get myInformation;

  /// No description provided for @userInformation.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get userInformation;

  /// No description provided for @addInformation.
  ///
  /// In en, this message translates to:
  /// **'Add Information'**
  String get addInformation;

  /// No description provided for @editInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit Information'**
  String get editInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameRequired;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @ageRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your age'**
  String get ageRequired;

  /// No description provided for @validAgeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid age'**
  String get validAgeRequired;

  /// No description provided for @favouriteHobby.
  ///
  /// In en, this message translates to:
  /// **'Favourite Hobby'**
  String get favouriteHobby;

  /// No description provided for @hobbyRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your favourite hobby'**
  String get hobbyRequired;

  /// No description provided for @saveInformation.
  ///
  /// In en, this message translates to:
  /// **'Save Information'**
  String get saveInformation;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @viewSavedRecords.
  ///
  /// In en, this message translates to:
  /// **'View Saved Records'**
  String get viewSavedRecords;

  /// No description provided for @savedInformation.
  ///
  /// In en, this message translates to:
  /// **'Saved Information'**
  String get savedInformation;

  /// No description provided for @noSavedInformation.
  ///
  /// In en, this message translates to:
  /// **'No saved information yet'**
  String get noSavedInformation;

  /// No description provided for @noInformationSavedYet.
  ///
  /// In en, this message translates to:
  /// **'No information saved yet'**
  String get noInformationSavedYet;

  /// No description provided for @noUserLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'No user is logged in'**
  String get noUserLoggedIn;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @dataSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Data saved successfully'**
  String get dataSavedSuccessfully;

  /// No description provided for @failedToSaveData.
  ///
  /// In en, this message translates to:
  /// **'Failed to save data'**
  String get failedToSaveData;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
