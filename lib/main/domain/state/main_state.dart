import 'dart:math';

import 'package:fire_app/auxiliary/constants.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/result/data/model/result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:yalo_locale/lib.dart';

part 'main_state.g.dart';

class MainState = _MainState with _$MainState;

abstract class _MainState with Store {
  _MainState(this._mainRepository);

  final MainRepository _mainRepository;
  final _loc = sl<LocalizationMessages>();

  @observable
  Coefficient coefficient;

  @observable
  double time;

  @observable
  String timeError = '';

  @computed
  bool get canCalculate => time != null && time > 0 && coefficient != null && timeError.isEmpty;

  Result get result => _mainRepository.getResult;

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
    timeError = '';
    if (time != null && time > 600) {
      timeError = _loc.main.error;
    }
  }

  bool calculate() {
    if (coefficient != null && time != null && time > 0) {
      final res = (unknownCoefficient * coefficient.value * pow(time, 0.9)).toStringAsFixed(2);
      final result = Result(time: time, coefficient: coefficient, value: res);
      _mainRepository.setResult = result;
      return true;
    }
    return false;
  }

  void init() {
    _mainRepository.loadCoefficient();
    timeController.addListener(setTime);
  }

  void clear() {
    coefficientController.text = '';
    timeController.text = '';
  }
}
