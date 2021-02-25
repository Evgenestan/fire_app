import 'package:fire_app/auxiliary/сlient.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:hive/hive.dart';

const HISTORY_BOX = 'history_box';

class HistoryClient extends Client {
  HistoryClient(this.box);
  final Box<HistoryEntry> box;
  Future<List<HistoryEntry>> getHistory() async {
    return box.values.toList(growable: false);
  }

  void addHistoryEntry(HistoryEntry historyEntry) {
    box.add(historyEntry);
  }

  void deleteHistoryEntry() {
    //box.deleteAt(index)
  }
}
