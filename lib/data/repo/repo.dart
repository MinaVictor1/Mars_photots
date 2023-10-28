import 'package:basicapp/data/Api/api.dart';
import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/utils/hivemangment.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Repo {
  late API _api;

  Repo() {
    _api = API();
  }

  Future<List<MarsPhoto>> fetchPhotos(DateTime earthDate) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      List<dynamic> jsonList = await _api.fetchPhotos(earthDate.toString());
      final photosList = jsonList.map((e) => MarsPhoto.fromJson(e)).toList();
      HiveManagment.storeMarsPhotos(photosList);
      debugPrint(photosList.length.toString());
      return photosList;
    } else {
      debugPrint(HiveManagment.getEarthDatePhotos(earthDate).length.toString());
      return HiveManagment.getEarthDatePhotos(earthDate);
    }
  }
}
