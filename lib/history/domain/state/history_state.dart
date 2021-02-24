import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:mobx/mobx.dart';

part 'history_state.g.dart';

class HistoryState = _HistoryState with _$HistoryState;

abstract class _HistoryState with Store {
  _HistoryState(this._historyRepository);
  final HistoryRepository _historyRepository;

  @observable
  ObservableList<HistoryEntry> history = ObservableList();

  @action
  Future<void> init() async {
    history.clear();
    history.addAll(await _historyRepository.getHistory());
    print(history.length);
  }

  @action
  void addHistoryEntry(HistoryEntry historyEntry) {
    _historyRepository.addHistoryEntry(historyEntry);
    history.add(historyEntry);
  }
}
