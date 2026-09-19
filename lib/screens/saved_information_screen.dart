import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/user_data.dart';

class SavedInformationScreen extends StatelessWidget {
  const SavedInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Information'), centerTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<UserData> users = snapshot.data!.docs.map((document) {
            final Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;

            return UserData.fromMap(data);
          }).toList();

          if (users.isEmpty) {
            return const Center(child: Text('No saved information yet'));
          }

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
                    'Age: ${user.age}\n'
                    'Favourite Hobby: ${user.favouriteHobby}',
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
