import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/main/data/repository/main_repository_impl.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';

class Repositories {
  static void init() {
    sl.registerSingleton<MainRepository>(MainRepositoryImpl());
  }
}
