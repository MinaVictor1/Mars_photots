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
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          title: const Text("Language"),
          trailing: DropdownButton(
            value: settings.get(languageValue, defaultValue: "en"),
            items: <String>["en", "ar"]
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e == "ar" ? "Arabic" : "English"),
                  ),
                )
                .toList(),
            onChanged: (v) => settings.put(languageValue, v!),
            focusColor: Colors.transparent,
            underline: const SizedBox(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
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
