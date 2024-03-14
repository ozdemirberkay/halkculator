// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShareAdapter extends TypeAdapter<Share> {
  @override
  final int typeId = 1;

  @override
  Share read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Share(
      price: fields[0] as double,
      lot: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Share obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.lot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
