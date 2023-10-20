import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/bottomnavbar.dart';
import 'widgets/settingbody.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleSetting),
      ),
      body: const SafeArea(child: SettingBody()),
    );
  }
}
