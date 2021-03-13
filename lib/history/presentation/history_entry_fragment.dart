import 'package:fire_app/auxiliary/colors.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryEntryFragment extends StatelessWidget {
  const HistoryEntryFragment(this.entry);
  final HistoryEntry entry;

  Widget _buildParameter({String title, String value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TextL(title, color: secondTextColor)),
          TextL(value, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: grayBackgroundColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingS(entry.title),
                TextM('кнопочки'),
              ],
            ),
            _buildParameter(title: 'Время горения:', value: entry.time),
            _buildParameter(title: 'Вид горючей нагрузки:', value: entry.coefficient),
            _buildParameter(title: 'Результат:', value: entry.result),
          ],
        ),
      ),
    );
  }
}
