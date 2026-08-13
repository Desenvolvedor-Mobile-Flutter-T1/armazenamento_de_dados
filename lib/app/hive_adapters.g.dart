// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CitacaoModelAdapter extends TypeAdapter<CitacaoModel> {
  @override
  final typeId = 0;

  @override
  CitacaoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CitacaoModel(
      id: (fields[0] as num).toInt(),
      texto: fields[1] as String,
      autor: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CitacaoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.texto)
      ..writeByte(2)
      ..write(obj.autor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CitacaoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
