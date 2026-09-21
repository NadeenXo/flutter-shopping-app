# Flutter Shopping App

A Flutter shopping application extended with **Firebase Authentication** and **Cloud Firestore**.

**GitHub:** https://github.com/NadeenXo/flutter-shopping-app

## Features

- Responsive Flutter shopping UI
- Product `PageView` and `GridView`
- Add-to-cart `SnackBar`
- Email and Password Sign Up
- Email and Password Login
- Firebase Authentication
- Cloud Firestore
- Save Name, Age, and Favourite Hobby
- Edit saved user information
- View saved Firestore records
- English and Arabic localization
- RTL support for Arabic
- Form validation
- Separate screens, widgets, and models

## Firebase Setup

The project uses:

firebase_core
firebase_auth
cloud_firestore

Firebase was configured using Firebase CLI and FlutterFire CLI:

Firebase is initialized in `main.dart`.

## Firebase Authentication

Firebase Authentication is used to create accounts and log in using Email and Password.

After a successful login, the user is redirected to the Shopping screen.

## Cloud Firestore

The Personal Information form contains: Name, Age, Favourite Hobby

Each authenticated user stores their information in the `users` collection using their Firebase UID as the document ID.

The application also contains a separate screen that reads and displays saved Firestore records in real time using `StreamBuilder`.

## App Flow

```text
Login
  ↓
Shopping Screen
  ↓
My Information
  ↓
Add / Edit Information
  ↓
Save to Cloud Firestore
  ↓
View Saved Records
```

New users can also create an account:

```text
Login
  ↓
Create Account
  ↓
Firebase Sign Up
  ↓
Shopping Screen
```

## Project Structure

```text
lib/
├── l10n/
│   ├── app_en.arb
│   └── app_ar.arb
├── models/
│   └── user_data.dart
├── screens/
│   ├── login_screen.dart
│   ├── sign_up_screen.dart
│   ├── shopping_screen.dart
│   ├── my_information_screen.dart
│   ├── personal_information_screen.dart
│   └── saved_information_screen.dart
├── widgets/
├── firebase_options.dart
└── main.dart
```

## Screenshots

### Firebase Login

The Login screen uses Firebase Authentication with Email and Password.

![Firebase Login](screenshots/Screenshot%202026-09-21%20190646.png)

### Home Screen After Login

After a successful login, the user is redirected to the Shopping screen.

![Home Screen](screenshots/Screenshot%202026-09-21%20190748.png)

### Personal Information Form

The user can enter their Name, Age, and Favourite Hobby.  
The form includes input validation.

![Personal Information Form](screenshots/Screenshot%202026-09-21%20190908.png)

### Saved Firestore Records

Saved information is read from Cloud Firestore and displayed on a separate screen.

![Saved Firestore Records](screenshots/Screenshot%202026-09-21%20190919.png)

### My Information

The logged-in user's information is loaded from Firestore and can be edited.

![My Information](screenshots/Screenshot%202026-09-21%20191040.png)

## Localization

The application supports both English and Arabic using Flutter localization.

Localization files:

```text
lib/l10n/app_en.arb
lib/l10n/app_ar.arb
```

Arabic supports RTL layout.

## Run the Project

Install dependencies:

```bash
flutter pub get
```

Generate localization files:

```bash
flutter gen-l10n
```

Format the project:

```bash
dart format .
```

Run the project:

```bash
flutter run
```

Or run on Microsoft Edge:

```bash
flutter run -d edge
```