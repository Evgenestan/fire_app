import 'package:fire_app/inject.dart';
import 'package:fire_app/main/presentation/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  Repositories.init();
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
      home: const MainView(title: 'Экспресс ОФП'),
    );
  }
}
