// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactHiveModelAdapter extends TypeAdapter<FactHiveModel> {
  @override
  final int typeId = 1;

  @override
  FactHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactHiveModel(
      fact: fields[0] as String,
      createdAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FactHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
