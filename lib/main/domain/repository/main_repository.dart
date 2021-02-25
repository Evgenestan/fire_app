import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/result/data/model/result_model.dart';

abstract class MainRepository {
  Result get getResult;
  set setResult(Result result);

  List<Coefficient> get coefficients;
  Future<void> loadCoefficient();
}
