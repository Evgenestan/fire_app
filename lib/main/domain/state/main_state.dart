import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';

class MainState {
  MainState(this._mainRepository);

  final MainRepository _mainRepository;

  List<Coefficient> get coefficients => _mainRepository.coefficients;

  void loadCoefficient() {
    _mainRepository.loadCoefficient();
  }
}
