import 'package:fire_app/auxiliary/inject.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/main/presentation/main_view.dart';
import 'package:flutter/material.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  Repositories.init();
  sl.registerSingleton<LocalizationMessages>(Messages.ru);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainView(),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
