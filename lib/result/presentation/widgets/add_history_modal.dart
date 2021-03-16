import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/history/domain/state/history_state.dart';
import 'package:fire_app/widgets/buttons.dart';
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

    String title = '';
    void _saveEntry() {
      if (title.isNotEmpty && !_historyState.titleAlreadyExists(title)) {
        Navigator.of(context).pop(title);
      }
    }

    _historyState.init();
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            //const SizedBox(height: 5),
            // Button(
            //   onPressed: _saveEntry,
            //   title: 'Сохранить',
            //   color: Colors.grey,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Button(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.clear, size: 30),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Button(
                    child: const Icon(Icons.save, size: 30),
                    onPressed: _saveEntry,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        )
      ],
    );
  }
}
