import 'package:basicapp/bloc/mars_photo/mars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocProvider(
          create: (context) => MarsCubit(),
          child: const HomePageBody(),
        ),
      ),
    );
  }
}
