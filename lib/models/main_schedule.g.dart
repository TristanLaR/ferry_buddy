// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleTypeAdapter extends TypeAdapter<ScheduleType> {
  @override
  final int typeId = 1;

  @override
  ScheduleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ScheduleType.Regular;
      case 1:
        return ScheduleType.SatHoliday;
      case 2:
        return ScheduleType.Sunday;
      default:
        return ScheduleType.Regular;
    }
  }

  @override
  void write(BinaryWriter writer, ScheduleType obj) {
    switch (obj) {
      case ScheduleType.Regular:
        writer.writeByte(0);
        break;
      case ScheduleType.SatHoliday:
        writer.writeByte(1);
        break;
      case ScheduleType.Sunday:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FerrySideAdapter extends TypeAdapter<FerrySide> {
  @override
  final int typeId = 2;

  @override
  FerrySide read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FerrySide.Summerville;
      case 1:
        return FerrySide.Millidgeville;
      default:
        return FerrySide.Summerville;
    }
  }

  @override
  void write(BinaryWriter writer, FerrySide obj) {
    switch (obj) {
      case FerrySide.Summerville:
        writer.writeByte(0);
        break;
      case FerrySide.Millidgeville:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FerrySideAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FerryScheduleItemAdapter extends TypeAdapter<FerryScheduleItem> {
  @override
  final int typeId = 0;

  @override
  FerryScheduleItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FerryScheduleItem(
      departureTime: fields[0] as TimeOfDay,
      scheduleType: fields[1] as ScheduleType,
      ferrySide: fields[2] as FerrySide,
    );
  }

  @override
  void write(BinaryWriter writer, FerryScheduleItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.departureTime)
      ..writeByte(1)
      ..write(obj.scheduleType)
      ..writeByte(2)
      ..write(obj.ferrySide);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FerryScheduleItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final typeId = 101;

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute);
  }

  TimeOfDay read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDay(
      hour: fields[0] as int,
      minute: fields[1] as int
    );
  }

}
