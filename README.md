# Flutter Shopping App

A Flutter Shopping App created for the Flutter Fundamentals Module Task.

The project demonstrates Flutter project setup, widgets, responsive layouts, form validation, navigation, animations, and English/Arabic localization.

## Features

* Stateless and Stateful widgets
* Local asset and network images
* Custom Suwannaphum font
* Responsive design using `MediaQuery`
* Product `PageView`
* Product `GridView` with two cards per row
* Add-to-cart `SnackBar`
* Hot Offers using `ListView.builder`
* Form validation
* Success dialog
* Navigation between screens
* Fade page transition
* English and Arabic localization
* RTL support for Arabic

## Project Setup

The project was created using Flutter CLI.

### Commands Used

```bash
flutter create first_flutter_project
cd first_flutter_project
flutter --version
code .
```

### Flutter Version

* Flutter 3.44.8
* Dart 3.12.2

## Project Structure

```text
lib/
├── l10n/
│   ├── app_en.arb
│   └── app_ar.arb
├── screens/
│   ├── first_project_screen.dart
│   ├── sign_up_screen.dart
│   └── shopping_screen.dart
├── widgets/
│   ├── images_row.dart
│   ├── project_message.dart
│   ├── product_card.dart
│   ├── product_page_view.dart
│   └── hot_offer_item.dart
└── main.dart
```

## Validation Rules

The Sign Up form validates the following:

* Full Name: first letter must be capitalized
* Email: must contain `@`
* Password: minimum 6 characters
* Confirm Password: must match the password

After successful validation, an account-created dialog is displayed. Closing the dialog navigates to the Shopping Screen using a fade transition.

## Localization

The application supports:

* English
* Arabic

All displayed application text is stored in ARB localization files. Arabic also supports right-to-left layout.

## Run the Project

Install dependencies:

```bash
flutter pub get
```

Generate localization files:

```bash
flutter gen-l10n
```

Run the application:

```bash
flutter run
```

## Code Quality

Before submission, the project was formatted and analyzed using:

```bash
dart format .
flutter analyze
```
