import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/data/service/main_client.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final List<Coefficient> _coefficients = [];

  @override
  Future<void> loadCoefficient() async {
    _coefficients.clear();
    _coefficients.addAll(await MainClient.getCoefficients());
  }

  @override
  List<Coefficient> get coefficients => _coefficients;
}
