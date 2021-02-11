import 'package:fire_app/constants.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:yalo_assets/lib.dart';

class ResultView extends StatefulWidget {
  const ResultView({@required this.time, @required this.coefficient, @required this.result});
  final double time;
  final Coefficient coefficient;
  final String result;
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  void _share() {
    Share.share('Время горения: ${widget.time}\nКоэфициент: ${widget.coefficient.title}\nРезультат: ${widget.result}');
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 100,
      child: Image.asset(
        Assets.fireIconS,
      ),
    );
  }

  Widget _buildInitialData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Исходные данные',
          style: TextStyle(fontSize: 24),
        ),
        Text('Время горения: ${widget.time} с'),
        Text('Коэффициент: ${widget.coefficient.title}', softWrap: false),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Результат',
          style: TextStyle(fontSize: 24),
        ),
        Text('То что мы считаем: ${widget.result}'),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Результаты расчета'),
      actions: [IconButton(icon: const Icon(Icons.share), onPressed: _share)],
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: appBar,
        body: ListView(
          padding: ListViewPadding,
          physics: const BouncingScrollPhysics(),
          children: [
            _buildLogo(),
            const SizedBox(height: 30),
            _buildInitialData(),
            const SizedBox(height: 15),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
