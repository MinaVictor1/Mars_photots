// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoverAdapter extends TypeAdapter<Rover> {
  @override
  final int typeId = 2;

  @override
  Rover read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rover(
      id: fields[0] as int?,
      name: fields[1] as String?,
      landingDate: fields[2] as String?,
      launchDate: fields[3] as String?,
      status: fields[4] as String?,
      maxSol: fields[5] as int?,
      maxDate: fields[6] as String?,
      totalPhotos: fields[7] as int?,
      cameras: (fields[8] as List?)?.cast<Camera>(),
    );
  }

  @override
  void write(BinaryWriter writer, Rover obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.landingDate)
      ..writeByte(3)
      ..write(obj.launchDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.maxSol)
      ..writeByte(6)
      ..write(obj.maxDate)
      ..writeByte(7)
      ..write(obj.totalPhotos)
      ..writeByte(8)
      ..write(obj.cameras);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoverAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rover _$RoverFromJson(Map<String, dynamic> json) => Rover(
      id: json['id'] as int?,
      name: json['name'] as String?,
      landingDate: json['landing_date'] as String?,
      launchDate: json['launch_date'] as String?,
      status: json['status'] as String?,
      maxSol: json['max_sol'] as int?,
      maxDate: json['max_date'] as String?,
      totalPhotos: json['total_photos'] as int?,
      cameras: (json['cameras'] as List<dynamic>?)
          ?.map((e) => Camera.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
