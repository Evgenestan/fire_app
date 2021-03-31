import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fire_app/auxiliary/base_client.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

const HISTORY_BOX = 'history_box';

class HistoryClient extends BaseClient {
  HistoryClient(this.box);
  final Box<HistoryEntry> box;
  Future<List<HistoryEntry>> getHistory() async {
    return box.values.toList(growable: false);
  }

  void addHistoryEntry(HistoryEntry historyEntry) {
    box.add(historyEntry);
  }

  void deleteHistoryEntry(HistoryEntry historyEntry) {
    final index = box.values.toList().indexWhere((value) => value.title == historyEntry.title);
    box.deleteAt(index);
  }

  Future<bool> exportHistory(String fileName) async {
    final historyList = (await getHistory()).map((e) => e.toList()).toList();
    historyList.insert(0, ['Название', 'Результат', 'Время', 'Вид горючей нагрузки']);
    final String csv = const ListToCsvConverter().convert(historyList);
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + '/$fileName.csv';
    final file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);
    await Share.shareFiles([file.path]);
    await file.delete();
    return true;
  }
}
