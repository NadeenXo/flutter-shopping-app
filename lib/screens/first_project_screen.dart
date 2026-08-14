import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/images_row.dart';
import '../widgets/project_message.dart';

class FirstProjectScreen extends StatelessWidget {
  const FirstProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.firstProjectTitle), centerTitle: true),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ImagesRow(), SizedBox(height: 30), ProjectMessage()],
        ),
      ),
    );
  }
}
