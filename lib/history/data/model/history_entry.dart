import 'package:hive/hive.dart';

part 'history_entry.g.dart';

@HiveType(typeId: 0)
class HistoryEntry {
  HistoryEntry({this.id, this.title, this.result, this.time, this.coefficient});

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String result;

  @HiveField(3)
  String time;

  @HiveField(4)
  String coefficient;

  @override
  String toString() {
    return title;
  }
}
