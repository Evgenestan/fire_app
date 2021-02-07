import 'package:fire_app/main/data/model/coefficient.dart';

abstract class MainRepository {
  List<Coefficient> get coefficients;
  Future<void> loadCoefficient();
}
