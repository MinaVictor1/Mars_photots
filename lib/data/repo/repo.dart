import 'package:basicapp/data/Api/api.dart';
import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/utils/hivemangment.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

class Repo {
  late API _api;

  Repo() {
    _api = API();
  }

  Future<List<MarsPhoto>> fetchPhotos(DateTime earthDate) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      // Format the DateTime object to a string with just the date part
      String formattedDate = dateFormat.format(earthDate);
      List<dynamic> jsonList = await _api.fetchPhotos(formattedDate);
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
