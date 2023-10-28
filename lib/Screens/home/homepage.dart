import 'package:flutter/material.dart';
import '../setting/widgets/drawer.dart';
import 'widgets/homepagebody.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.titleHome),
        ),
        endDrawer: const DrawerPage(),
        body: const HomePageBody(),
      ),
    );
  }
}
