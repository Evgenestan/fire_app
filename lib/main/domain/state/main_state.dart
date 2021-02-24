import 'dart:math';

import 'package:fire_app/auxiliary/constants.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'main_state.g.dart';

class MainState = _MainState with _$MainState;

abstract class _MainState with Store {
  _MainState(this._mainRepository);

  final MainRepository _mainRepository;

  @observable
  Coefficient coefficient;

  @observable
  double time;

  @computed
  bool get canCalculate => time != null && time > 0 && coefficient != null;

  List<Coefficient> get coefficients => _mainRepository.coefficients;

  TextEditingController coefficientController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  @action
  void setCoefficient(Coefficient coefficient) {
    if (coefficient != null) {
      this.coefficient = coefficient;
      coefficientController.text = coefficient.title;
    }
  }

  @action
  void setTime() {
    time = double.tryParse(timeController.text);
  }

  String getResultOfCalculated() {
    if (coefficient != null && time != null && time > 0) {
      return (unknownCoefficient * coefficient.value * pow(time, 0.9)).toStringAsFixed(2);
    }
    return null;
  }

  void init() {
    _mainRepository.loadCoefficient();
    timeController.addListener(setTime);
  }
}
