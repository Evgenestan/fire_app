import 'package:fire_app/auxiliary/inject.dart';
import 'package:fire_app/auxiliary/router.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:flutter/material.dart';
import 'package:yalo_locale/lib.dart';

Future<void> main() async {
  sl.registerSingleton<LocalizationMessages>(Messages.ru);
  final _clients = await init();
  Repositories.init(_clients);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.to.main,
      routes: Routes().routes,
      title: 'Экспресс ОФП',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
