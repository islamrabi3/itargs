// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_likes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopLikesTextAdapter extends TypeAdapter<TopLikesText> {
  @override
  final int typeId = 1;

  @override
  TopLikesText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopLikesText(
      textSample: fields[2] as String?,
      isLiked: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TopLikesText obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.textSample)
      ..writeByte(3)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopLikesTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
