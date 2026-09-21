import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/user_data.dart';
import 'saved_information_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  final UserData? existingUser;

  const PersonalInformationScreen({super.key, this.existingUser});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Fill the form with existing data when editing.
    final UserData? user = widget.existingUser;

    if (user != null) {
      _nameController.text = user.name;
      _ageController.text = user.age.toString();
      _hobbyController.text = user.favouriteHobby;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _hobbyController.dispose();
    super.dispose();
  }

  Future<void> _saveUserData() async {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final int? age = int.tryParse(_ageController.text.trim());

    if (age == null) {
      return;
    }

    // Get the currently authenticated Firebase user.
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }

    final UserData userData = UserData(
      name: _nameController.text.trim(),
      age: age,
      favouriteHobby: _hobbyController.text.trim(),
    );

    try {
      // Save one Firestore document for the logged-in user.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .set(userData.toMap());

      if (!mounted) {
        return;
      }

      // Return to My Information after saving successfully.
      Navigator.pop(context);
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${l10n.failedToSaveData}: $error')),
      );
    }
  }

  void _openSavedRecords() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SavedInformationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool isEditing = widget.existingUser != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? l10n.editInformation : l10n.userInformation),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: l10n.name,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.nameRequired;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l10n.age,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.ageRequired;
                  }

                  final int? age = int.tryParse(value.trim());

                  if (age == null || age <= 0) {
                    return l10n.validAgeRequired;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hobbyController,
                decoration: InputDecoration(
                  labelText: l10n.favouriteHobby,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.hobbyRequired;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveUserData,
                  child: Text(
                    isEditing ? l10n.saveChanges : l10n.saveInformation,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _openSavedRecords,
                  icon: const Icon(Icons.list),
                  label: Text(l10n.viewSavedRecords),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
