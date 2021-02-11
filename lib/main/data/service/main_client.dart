import 'dart:convert';

import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:flutter/services.dart';

class MainClient {
  static Future<List<Coefficient>> getCoefficients() async {
    final text = await rootBundle.loadString('assets/data/coeffTest.json');
    final items = (jsonDecode(text) ?? <dynamic>[]) as List;
    return items.map((dynamic json) => Coefficient.fromJson(json)).toList(growable: false);
  }
}