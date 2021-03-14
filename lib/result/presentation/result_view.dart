import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/history/domain/state/history_state.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/main/domain/state/main_state.dart';
import 'package:fire_app/result/data/model/result_model.dart';
import 'package:fire_app/result/presentation/widgets/add_history_modal.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:yalo_locale/lib.dart';

class ResultView extends StatefulWidget {
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  final _loc = sl<LocalizationMessages>();
  final HistoryState _historyState = HistoryState(sl<HistoryRepository>());
  final MainState _mainState = MainState(sl<MainRepository>());
  Result result;
  void _share() {
    Share.share('${_loc.result.fireTime}: ${result.time} сек.\n${_loc.result.load}: ${result.coefficient.title}\nРезультат: ${result.value} (м)');
  }

  Future<void> _save() async {
    final title = await showDialog<String>(context: context, builder: (_) => AddHistoryModal());
    if (title != null && title.isNotEmpty) {
      final entry = HistoryEntry(title: title, result: result.value, coefficient: result.coefficient.title, time: result.time.toString());
      _historyState.addHistoryEntry(entry);
    }
  }

  Widget _buildEnteredParameter({String title, String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextL(
            title + ':',
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 120,
          child: TextM(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInitialData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _loc.result.initialData,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        _buildEnteredParameter(title: _loc.result.fireTime, value: '${result.time} сек.'),
        const SizedBox(height: 15),
        _buildEnteredParameter(title: _loc.result.load, value: result.coefficient.title),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadingL(_loc.result.result),
        const SizedBox(height: 20),
        TextL(_loc.result.descriptions.prefix, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(3)),
          child: HeadingM(
            result.value + _loc.result.unit,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        TextM(
          _loc.result.descriptions.suffix,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: _save,
          child: Container(
            width: 300,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(3)),
            child: const HeadingM(
              'Сохранить',
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _historyState.init();
    result = _mainState.result;
  }

  @override
  Widget build(BuildContext context) {
    final appBar = ExpressAppBar(
      title: _loc.result.title,
      actions: [IconButton(icon: const Icon(Icons.share), onPressed: _share)],
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: appBar,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 25),
          physics: const BouncingScrollPhysics(),
          children: [
            _buildInitialData(),
            const SizedBox(height: 50),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
