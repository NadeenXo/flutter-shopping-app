import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'shopping_screen.dart';

class SignUpScreen extends StatefulWidget {
  final ValueChanged<Locale> onLocaleChange;

  const SignUpScreen({super.key, required this.onLocaleChange});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Changes between English and Arabic.
  void _toggleLanguage() {
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    widget.onLocaleChange(Locale(currentLanguage == 'en' ? 'ar' : 'en'));
  }

  // Validates the form and creates a Firebase Authentication account.
  Future<void> _submitForm() async {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      // Create a new user using Firebase Authentication.
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );

      // Save the entered full name as the Firebase display name.
      await userCredential.user?.updateDisplayName(
        _fullNameController.text.trim(),
      );

      if (!mounted) {
        return;
      }

      _showSuccessDialog();
    } on FirebaseAuthException catch (error) {
      if (!mounted) {
        return;
      }

      String message;

      if (error.code == 'email-already-in-use') {
        message = l10n.accountAlreadyExists;
      } else if (error.code == 'weak-password') {
        message = l10n.weakPassword;
      } else if (error.code == 'invalid-email') {
        message = l10n.invalidEmail;
      } else {
        message = l10n.somethingWentWrong;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  // Shows a success message after account creation.
  void _showSuccessDialog() {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.success),
          content: Text(l10n.accountCreatedSuccessfully),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _navigateToShoppingScreen();
              },
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }

  // Opens the shopping screen after successful sign-up.
  void _navigateToShoppingScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return ShoppingScreen(onLocaleChange: widget.onLocaleChange);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final CurvedAnimation curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );

          return FadeTransition(opacity: curvedAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.signUp),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _toggleLanguage,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: l10n.fullName,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.fullNameRequired;
                  }

                  final String name = value.trim();

                  // Capital-letter validation is only relevant in English.
                  if (isEnglish && name[0] != name[0].toUpperCase()) {
                    return l10n.firstLetterCapital;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.email,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.emailRequired;
                  }

                  if (!value.contains('@')) {
                    return l10n.emailMustContainAt;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.passwordRequired;
                  }

                  if (value.length < 6) {
                    return l10n.passwordMinLength;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.confirmPassword,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.confirmPasswordRequired;
                  }

                  if (value != _passwordController.text) {
                    return l10n.passwordsDoNotMatch;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(l10n.createAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
