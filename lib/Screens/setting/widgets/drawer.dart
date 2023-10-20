import 'package:basicapp/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.drawerTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          TextButton.icon(
              onPressed: () {
                GoRouter.of(context).push(Approute.kSetting);
              },
              icon: const Icon(Icons.settings),
              label: Text(AppLocalizations.of(context)!.settingNav))
        ],
      ),
    );
  }
}
