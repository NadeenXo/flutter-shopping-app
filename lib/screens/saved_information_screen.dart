import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/user_data.dart';

class SavedInformationScreen extends StatelessWidget {
  const SavedInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.savedInformation), centerTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        // Listen to all documents in the users collection in real time.
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(l10n.somethingWentWrong));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return Center(child: Text(l10n.noSavedInformation));
          }

          final List<UserData> users = documents.map((document) {
            final Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;

            return UserData.fromMap(data);
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final UserData user = users[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user.name),
                  subtitle: Text(
                    '${l10n.age}: ${user.age}\n'
                    '${l10n.favouriteHobby}: ${user.favouriteHobby}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
