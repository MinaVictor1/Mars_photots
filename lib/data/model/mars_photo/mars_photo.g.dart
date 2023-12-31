// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mars_photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarsPhotoAdapter extends TypeAdapter<MarsPhoto> {
  @override
  final int typeId = 0;

  @override
  MarsPhoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarsPhoto(
      id: fields[0] as int?,
      sol: fields[1] as int?,
      camera: fields[2] as Camera?,
      imgSrc: fields[3] as String?,
      earthDate: fields[4] as DateTime?,
      rover: fields[5] as Rover?,
    );
  }

  @override
  void write(BinaryWriter writer, MarsPhoto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sol)
      ..writeByte(2)
      ..write(obj.camera)
      ..writeByte(3)
      ..write(obj.imgSrc)
      ..writeByte(4)
      ..write(obj.earthDate)
      ..writeByte(5)
      ..write(obj.rover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarsPhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarsPhoto _$MarsPhotoFromJson(Map<String, dynamic> json) => MarsPhoto(
      id: json['id'] as int?,
      sol: json['sol'] as int?,
      camera: json['camera'] == null
          ? null
          : Camera.fromJson(json['camera'] as Map<String, dynamic>),
      imgSrc: json['img_src'] as String?,
      earthDate: MarsPhoto._fromDate(json['earth_date'] as String),
      rover: json['rover'] == null
          ? null
          : Rover.fromJson(json['rover'] as Map<String, dynamic>),
    );
