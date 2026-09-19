# Flutter Shopping App

Flutter Fundamentals module task built with Flutter and Dart.

**GitHub:** https://github.com/NadeenXo/flutter-shopping-app

## Features

- Stateless and Stateful widgets
- Local and network images
- Suwannaphum custom font
- Responsive UI with `MediaQuery`
- Product `PageView`
- Two-column product `GridView`
- Add-to-cart `SnackBar`
- Five Hot Offers using `ListView.builder` and `Expanded`
- Sign Up form with inline validation
- Success dialog and navigation
- Smooth fade page transition
- English and Arabic ARB localization with RTL support

## Phase 1 - Project Setup

Commands used:

```bash
flutter create first_flutter_project
cd first_flutter_project
flutter --version
code .
```

Flutter: **3.44.8**  
Dart: **3.12.2**

![Project Creation](../Project_Creation.png)

![Flutter Version](../Flutter_Version.png)

## Phase 2 - Images and Text

The Phase 2 screen includes `My First Project`, one asset image, one network image, spacing, and the styled text `The two images are displayed` using the Suwannaphum font.

![Phase 2](../Screenshot%202026-08-14%20125425.png)

## Phase 3 - Shopping Screen

The Shopping Screen uses `MediaQuery`, `PageView`, a two-column `GridView`, an add-to-cart `SnackBar`, and five Hot Offers using `ListView.builder`.

![Shopping Screen](../Screenshot%202026-08-14%20125216.png)

![Hot Offers](../Screenshot%202026-08-14%20125229.png)

![Add to Cart SnackBar](../Screenshot%202026-08-14%20125638.png)

## Phase 4 - Sign Up and Validation

Validation rules:

- Full Name: first letter must be capital
- Email: must contain `@`
- Password: minimum 6 characters
- Confirm Password: must match password

A valid form displays `Account created successfully` before navigating to the Shopping Screen.

![Sign Up](../Screenshot%202026-08-14%20124836.png)

![Validation](../Screenshot%202026-08-14%20124926.png)

![Success Dialog](../Screenshot%202026-08-14%20125156.png)

## Phase 5 - Fade Transition

Navigation from Sign Up to Shopping uses `PageRouteBuilder`, `FadeTransition`, `Curves.easeInOut`, and a 600 ms duration.

The Shopping Screen after successful navigation is shown below:

![After Fade Transition](../Screenshot%202026-08-14%20125216.png)

## Phase 6 - Localization

Flutter localization uses:

- `l10n.yaml`
- `lib/l10n/app_en.arb`
- `lib/l10n/app_ar.arb`
- `AppLocalizations`

All displayed text is taken from ARB localization entries. Arabic supports RTL layout.

![Arabic Sign Up](../Screenshot%202026-08-14%20125519.png)

![Arabic Shopping](../Screenshot%202026-08-14%20125256.png)

![Arabic Hot Offers](../Screenshot%202026-08-14%20125246.png)

![Arabic Add to Cart](../Screenshot%202026-08-14%20125631.png)

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

## Run and Check

```bash
flutter pub get
flutter gen-l10n
dart format .
flutter analyze
flutter run
```

The project uses separate reusable widget files, descriptive names, short comments for important logic, and ARB localization instead of hard-coded displayed text.
