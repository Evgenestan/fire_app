import 'dart:convert';

import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:flutter/services.dart';

class MainRepositoryImpl implements MainRepository {
  final List<Coefficient> _coefficients = [];

  @override
  Future<void> loadCoefficient() async {
    final text = await rootBundle.loadString('assets/data/coeff.json');
    final items = (jsonDecode(text) ?? <dynamic>[]) as List;
    _coefficients.clear();
    _coefficients.addAll(items.map((dynamic e) => Coefficient(id: e['id'], title: e['title'], value: e['value'])));
  }

  @override
  List<Coefficient> get coefficients => _coefficients;
}
