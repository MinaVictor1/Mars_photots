import 'package:basicapp/data/Api/api.dart';
import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/data/repo/repo.dart';
import 'package:flutter/material.dart';
import '../setting/widgets/drawer.dart';
import 'widgets/homepagebody.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final api = API();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.titleHome),
        ),
        endDrawer: const DrawerPage(),
        body: const HomePageBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            List<MarsPhoto> photos =
                await Repo().fetchPhotos(DateTime(2023, 9, 26));
            debugPrint(photos.length.toString());
          },
          child: const Icon(Icons.abc),
        ),
      ),
    );
  }
}
