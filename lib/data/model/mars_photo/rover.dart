import 'package:hive/hive.dart';
import 'camera.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rover.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(createToJson: false)
class Rover {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  @JsonKey(name: 'landing_date')
  final String? landingDate;
  @HiveField(3)
  @JsonKey(name: 'launch_date')
  final String? launchDate;
  @HiveField(4)
  final String? status;
  @HiveField(5)
  @JsonKey(name: 'max_sol')
  final int? maxSol;
  @HiveField(6)
  @JsonKey(name: 'max_date')
  final String? maxDate;
  @HiveField(7)
  @JsonKey(name: 'total_photos')
  final int? totalPhotos;
  @HiveField(8)
  final List<Camera>? cameras;

  const Rover({
    this.id,
    this.name,
    this.landingDate,
    this.launchDate,
    this.status,
    this.maxSol,
    this.maxDate,
    this.totalPhotos,
    this.cameras,
  });
  factory Rover.fromJson(Map<String, dynamic> json) => _$RoverFromJson(json);
}
