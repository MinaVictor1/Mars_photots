import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.onTap,
  });

  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        // selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.homeNav),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settingNav),
        ]);
  }
}
