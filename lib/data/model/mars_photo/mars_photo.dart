import 'package:hive/hive.dart';
import 'camera.dart';
import 'rover.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mars_photo.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(createToJson: false)
class MarsPhoto {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? sol;
  @HiveField(2)
  final Camera? camera;
  @HiveField(3)
  @JsonKey(name: 'img_src')
  final String? imgSrc;
  @HiveField(4)
  @JsonKey(name: 'earth_date')
  final String? earthDate;
  @HiveField(5)
  final Rover? rover;

  const MarsPhoto({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });

  factory MarsPhoto.fromJson(Map<String, dynamic> json) =>
      _$MarsPhotoFromJson(json);
}
