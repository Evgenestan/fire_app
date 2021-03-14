import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/history/domain/state/history_state.dart';
import 'package:fire_app/widgets/input/text_input.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yalo_locale/lib.dart';

class AddHistoryModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HistoryState _historyState = HistoryState(sl<HistoryRepository>());
    final _loc = sl<LocalizationMessages>();

    String title;
    void saveEntry() {
      if (!_historyState.titleAlreadyExists(title)) {
        Navigator.of(context).pop(title);
      }
    }

    _historyState.init();
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      titlePadding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadingM(_loc.history.add),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => TextInput(
                label: _loc.history.name,
                onChanged: (text) => title = text,
                errorText: _historyState.titleError,
              ),
            ),
            const SizedBox(height: 20),
            RaisedButton(onPressed: saveEntry, child: TextM(_loc.history.buttons.add)),
          ],
        )
      ],
    );
  }
}
