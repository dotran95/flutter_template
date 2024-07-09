// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingAdapter extends TypeAdapter<Setting> {
  @override
  final int typeId = 1;

  @override
  Setting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Setting()
      ..version = fields[0] == null ? '1.0.0' : fields[0] as String
      ..language = fields[1] as Language
      ..mode = fields[2] as HiveAppModes;
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.version)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.mode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 2;

  @override
  Language read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Language.vi;
      case 1:
        return Language.en;
      default:
        return Language.en;
    }
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    switch (obj) {
      case Language.vi:
        writer.writeByte(0);
        break;
      case Language.en:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveAppModesAdapter extends TypeAdapter<HiveAppModes> {
  @override
  final int typeId = 3;

  @override
  HiveAppModes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HiveAppModes.dark;
      case 1:
        return HiveAppModes.light;
      default:
        return HiveAppModes.light;
    }
  }

  @override
  void write(BinaryWriter writer, HiveAppModes obj) {
    switch (obj) {
      case HiveAppModes.dark:
        writer.writeByte(0);
        break;
      case HiveAppModes.light:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAppModesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
