import 'package:fire_app/auxiliary/routes.dart';
import 'package:fire_app/info/presentation/info_view.dart';
import 'package:fire_app/main/presentation/main_view.dart';
import 'package:fire_app/result/presentation/result_view.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static To to = To();
  Map<String, Widget Function(BuildContext)> routes = {
    to.main: (context) => MainView(),
    to.result: (context) => ResultView(),
    to.info: (context) => InfoView(),
  };
}
