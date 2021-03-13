import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/history/domain/state/history_state.dart';
import 'package:fire_app/history/presentation/history_entry_fragment.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final HistoryState _historyState = HistoryState(sl<HistoryRepository>());

  Widget _buildEntry(BuildContext context, int index) {
    return HistoryEntryFragment(_historyState.history[index]);
  }

  @override
  void initState() {
    super.initState();
    _historyState.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExpressAppBar(title: 'Журнал'),
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
