import 'package:fire_app/main/data/repository/main_repository_impl.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:get_it/get_it.dart';

class Repositories {
  static void init() {
    GetIt.I.registerSingleton<MainRepository>(MainRepositoryImpl());
  }
}
