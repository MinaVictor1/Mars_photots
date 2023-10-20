// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CameraAdapter extends TypeAdapter<Camera> {
  @override
  final int typeId = 1;

  @override
  Camera read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Camera(
      id: fields[0] as int?,
      name: fields[1] as String?,
      roverId: fields[2] as int?,
      fullName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Camera obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.roverId)
      ..writeByte(3)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CameraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Camera _$CameraFromJson(Map<String, dynamic> json) => Camera(
      id: json['id'] as int?,
      name: json['name'] as String?,
      roverId: json['rover_id'] as int?,
      fullName: Camera._toCapital(json['full_name'] as String),
    );
