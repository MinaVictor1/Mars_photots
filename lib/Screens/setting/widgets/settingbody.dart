import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    Box settings = Hive.box(settingBox);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(AppLocalizations.of(context)!.arabic),
            ValueListenableBuilder(
              valueListenable: Hive.box(settingBox).listenable(),
              builder: (context, box, _) {
                String language =
                    settings.get(languageValue, defaultValue: "en");
                return Switch(
                  value: language == "en",
                  onChanged: (val) =>
                      settings.put(languageValue, val ? "en" : "ar"),
                );
              },
            ),
            Text(AppLocalizations.of(context)!.english),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(AppLocalizations.of(context)!.light),
            ValueListenableBuilder(
                valueListenable: settings.listenable(),
                builder: (context, box, _) {
                  Box darkModeBox = settings;
                  bool darkModeValue =
                      darkModeBox.get("darkMode", defaultValue: false);
                  return Switch(
                    value: darkModeValue,
                    onChanged: (val) =>
                        darkModeBox.put('darkMode', !darkModeValue),
                  );
                }),
            Text(AppLocalizations.of(context)!.dark),
          ],
        ),
      ],
    );
  }
}
