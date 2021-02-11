import 'dart:math';

import 'package:fire_app/constants.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:flutter/cupertino.dart';

class MainState {
  MainState(this._mainRepository);

  final MainRepository _mainRepository;

  Coefficient coefficient;

  double time;

  List<Coefficient> get coefficients => _mainRepository.coefficients;

  TextEditingController coefficientController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  void setCoefficient(Coefficient coefficient) {
    if (coefficient != null) {
      this.coefficient = coefficient;
      coefficientController.text = coefficient.title;
    }
  }

  void setTime() {
    time = double.tryParse(timeController.text);
  }

  String getResultOfCalculated() {
    if (coefficient != null && time != null) {
      return (unknownCoefficient * coefficient.value * pow(time, 0.9)).toStringAsFixed(2);
    }
    return null;
  }

  void init() {
    _mainRepository.loadCoefficient();
    timeController.addListener(setTime);
  }
}
