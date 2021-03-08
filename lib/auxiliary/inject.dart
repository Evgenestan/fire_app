import 'package:fire_app/auxiliary/base_client.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/history/data/model/history_entry.dart';
import 'package:fire_app/history/data/repository/history_repository_impl.dart';
import 'package:fire_app/history/data/service/history_client.dart';
import 'package:fire_app/history/domain/repository/history_repository.dart';
import 'package:fire_app/main/data/repository/main_repository_impl.dart';
import 'package:fire_app/main/data/service/main_client.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Repositories {
  static void init(Set<BaseClient> clients) {
    sl.registerSingleton<MainRepository>(MainRepositoryImpl(clients.whereType<MainClient>().first)); //TODO: переделать
    sl.registerSingleton<HistoryRepository>(HistoryRepositoryImpl(clients.whereType<HistoryClient>().first));
  }
}

Future<Set<BaseClient>> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryEntryAdapter());
  final historyBox = await Hive.openBox<HistoryEntry>(HISTORY_BOX, crashRecovery: true);
  final Set<BaseClient> _clients = {
    MainClient(),
    HistoryClient(historyBox),
  };
  return _clients;
}
