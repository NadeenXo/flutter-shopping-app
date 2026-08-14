import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class ProjectMessage extends StatelessWidget {
  const ProjectMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Text(
      l10n.twoImagesDisplayed,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'Suwannaphum',
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
