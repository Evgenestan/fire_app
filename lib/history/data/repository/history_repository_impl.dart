import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/history/data/service/history_client.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl(this._historyClient);
  final HistoryClient _historyClient;

  @override
  Future<List<HistoryEntry>> getHistory() async {
    return _historyClient.getHistory();
  }

  @override
  void addHistoryEntry(HistoryEntry historyEntry) {
    _historyClient.addHistoryEntry(historyEntry);
  }

  @override
  void deleteHistoryEntry(HistoryEntry historyEntry) {
    _historyClient.deleteHistoryEntry(historyEntry);
  }
}
