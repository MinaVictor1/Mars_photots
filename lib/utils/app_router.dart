import 'package:basicapp/Screens/home/homepage.dart';
import 'package:basicapp/Screens/home/photos.dart';
import 'package:basicapp/Screens/setting/setting.dart';
import 'package:go_router/go_router.dart';

abstract class Approute {
  static const kSetting = '/Setting';
  static const kPhotos = '/Photos';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kSetting,
        builder: (context, state) => const Setting(),
      ),
      GoRoute(
        path: kPhotos,
        builder: (context, state) => const PhotosPage(),
      ),
    ],
  );
}
