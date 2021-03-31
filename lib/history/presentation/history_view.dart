import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/history/domain/state/history_state.dart';
import 'package:fire_app/history/presentation/history_entry_fragment.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:fire_app/widgets/modal/save_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yalo_locale/lib.dart';

class HistoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final HistoryState _historyState = HistoryState(sl<HistoryRepository>());
  final _loc = sl<LocalizationMessages>();

  Future<void> _exportToCsv() async {
    String fileName = await showDialog<String>(context: context, builder: (_) => const SaveDialog(title: 'Экспорт', label: 'Название'));
    if (fileName != null) {
      if (fileName.isEmpty) {
        fileName = 'fireAppExportToCsv';
      }
      await _historyState.exportToCsv(fileName);
    }
  }

  Widget _buildEntry(BuildContext context, int index) {
    final historyEntry = _historyState.history[index];
    return HistoryEntryFragment(entry: historyEntry, onDelete: () => _historyState.deleteHistoryEntry(historyEntry));
  }

  @override
  void initState() {
    super.initState();
    _historyState.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExpressAppBar(title: _loc.history.title, actions: [IconButton(icon: const Icon(Icons.file_download), onPressed: _exportToCsv)]),
      body: Observer(
        builder: (_) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 90),
          itemBuilder: _buildEntry,
          itemCount: _historyState.history.length,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
