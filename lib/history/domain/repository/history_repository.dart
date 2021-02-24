import 'package:fire_app/history/data/model/history_entry.dart';

abstract class HistoryRepository {
  Future<List<HistoryEntry>> getHistory();
  void addHistoryEntry(HistoryEntry historyEntry);
}
