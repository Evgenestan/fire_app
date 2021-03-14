import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:yalo_locale/lib.dart';

part 'history_state.g.dart';

class HistoryState = _HistoryState with _$HistoryState;

abstract class _HistoryState with Store {
  _HistoryState(this._historyRepository);
  final HistoryRepository _historyRepository;
  final _loc = sl<LocalizationMessages>();

  @observable
  ObservableList<HistoryEntry> history = ObservableList();

  @observable
  String titleError = '';

  bool titleAlreadyExists(String title) {
    final result = !history.every((element) => element.title != title);
    if (result) {
      titleError = _loc.history.error;
    }
    return result;
  }

  @action
  Future<void> init() async {
    history.clear();
    history.addAll(await _historyRepository.getHistory());
  }

  @action
  void addHistoryEntry(HistoryEntry historyEntry) {
    _historyRepository.addHistoryEntry(historyEntry);
    history.add(historyEntry);
  }

  @action
  void deleteHistoryEntry(HistoryEntry historyEntry) {
    _historyRepository.deleteHistoryEntry(historyEntry);
    history.removeWhere((element) => element.title == historyEntry.title);
  }
}
