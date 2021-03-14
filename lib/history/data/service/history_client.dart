import 'package:fire_app/auxiliary/base_client.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:hive/hive.dart';

const HISTORY_BOX = 'history_box';

class HistoryClient extends BaseClient {
  HistoryClient(this.box);
  final Box<HistoryEntry> box;
  Future<List<HistoryEntry>> getHistory() async {
    return box.values.toList(growable: false);
  }

  void addHistoryEntry(HistoryEntry historyEntry) {
    box.add(historyEntry);
  }

  void deleteHistoryEntry(HistoryEntry historyEntry) {
    final index = box.values.toList().indexWhere((value) => value.title == historyEntry.title);
    box.deleteAt(index);
  }
}
