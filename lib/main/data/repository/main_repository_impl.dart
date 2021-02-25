import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/data/service/main_client.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/result/data/model/result_model.dart';

class MainRepositoryImpl implements MainRepository {
  MainRepositoryImpl(this._mainClient);
  final MainClient _mainClient;
  final List<Coefficient> _coefficients = [];
  Result _result;

  @override
  Future<void> loadCoefficient() async {
    _coefficients.clear();
    _coefficients.addAll(await _mainClient.getCoefficients());
  }

  @override
  List<Coefficient> get coefficients => _coefficients;

  @override
  Result get getResult => _result;

  @override
  set setResult(Result result) => _result = result;
}
