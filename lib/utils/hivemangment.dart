import 'package:basicapp/data/model/mars_photo/camera.dart';
import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/data/model/mars_photo/rover.dart';
import 'package:basicapp/utils/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManagment {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MarsPhotoAdapter());
    Hive.registerAdapter(CameraAdapter());
    Hive.registerAdapter(RoverAdapter());

    await Hive.openBox(settingBox);
    await Hive.openBox<MarsPhoto>(photosBox);
  }

  static void storeMarsPhotos(List<MarsPhoto> marsPhotos) {
    debugPrint(marsPhotos[0].imgSrc);
    for (MarsPhoto photo in marsPhotos) {
      Hive.box<MarsPhoto>(photosBox).put(photo.id, photo);
    }
  }

  static List<MarsPhoto> getEarthDatePhotos(DateTime earthDate) {
    return Hive.box<MarsPhoto>(photosBox)
        .values
        .where(
            (element) => earthDate.toString() == element.earthDate.toString())
        .toList();
  }
}
