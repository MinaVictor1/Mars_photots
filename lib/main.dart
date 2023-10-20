import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utils/app_router.dart';
import 'utils/constant.dart';
import 'utils/theme/color_schemes.g.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utils/theme/typography.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(settingBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(settingBox).listenable(),
        builder: (context, box, _) {
          bool darkMode = box.get(darkModeValue, defaultValue: false);
          String language = box.get(languageValue, defaultValue: "en");
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              //localization
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(language),
              //theme
              themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                  colorScheme: lightColorScheme,
                  useMaterial3: true,
                  textTheme: textTheme),
              darkTheme: ThemeData(
                  colorScheme: darkColorScheme,
                  useMaterial3: true,
                  textTheme: textTheme),
              //Navigation
              routerConfig: Approute.router,
            );
          });
        });
  }
}
