import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'camera.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class Camera {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  @JsonKey(name: 'rover_id')
  final int? roverId;
  @HiveField(3)
  @JsonKey(name: 'full_name', fromJson: _toCapital)
  final String? fullName;

  const Camera({this.id, this.name, this.roverId, this.fullName});

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);

  static String _toCapital(String name) {
    return name.toUpperCase();
  }
}
