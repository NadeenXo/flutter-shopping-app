import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/user_data.dart';
import 'personal_information_screen.dart';

class MyInformationScreen extends StatelessWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    // Get the currently signed-in Firebase user.
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return Scaffold(body: Center(child: Text(l10n.noUserLoggedIn)));
    }

    final String userId = currentUser.uid;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myInformation), centerTitle: true),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        // Listen to the logged-in user's Firestore document in real time.
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(l10n.somethingWentWrong));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInformationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: Text(l10n.addInformation),
              ),
            );
          }

          final Map<String, dynamic> data = snapshot.data!.data()!;

          final UserData user = UserData.fromMap(data);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Icon(Icons.person, size: 80)),
                const SizedBox(height: 30),
                Text(
                  l10n.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user.name, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 24),
                Text(
                  l10n.age,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user.age.toString(), style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 24),
                Text(
                  l10n.favouriteHobby,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user.favouriteHobby, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PersonalInformationScreen(existingUser: user),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: Text(l10n.editInformation),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
