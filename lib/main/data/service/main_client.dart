import 'dart:convert';

import 'package:fire_app/auxiliary/сlient.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:flutter/services.dart';

class MainClient extends Client {
  Future<List<Coefficient>> getCoefficients() async {
    final text = await rootBundle.loadString('assets/data/coeff.json');
    final items = (jsonDecode(text) ?? <dynamic>[]) as List;
    return items.map((dynamic json) => Coefficient.fromJson(json)).toList(growable: false);
  }
}
