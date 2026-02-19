// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revelation_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RevelationTypeAdapter extends TypeAdapter<RevelationType> {
  @override
  final int typeId = 2;

  @override
  RevelationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RevelationType.meccan;
      case 1:
        return RevelationType.medinan;
      default:
        return RevelationType.meccan;
    }
  }

  @override
  void write(BinaryWriter writer, RevelationType obj) {
    switch (obj) {
      case RevelationType.meccan:
        writer.writeByte(0);
        break;
      case RevelationType.medinan:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevelationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
