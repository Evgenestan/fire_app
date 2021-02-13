import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
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
    Share.share('Время горения: ${widget.time} сек.\nКоэфициент: ${widget.coefficient.title}\nРезультат: ${widget.result}');
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 150,
      child: Image.asset(
        Assets.fireIconS,
      ),
    );
  }

  Widget _buildEnteredParameter({String title, String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            value,
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInitialData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Введенные параметры',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        _buildEnteredParameter(title: 'Время горения:', value: '${widget.time} сек.'),
        const SizedBox(height: 15),
        _buildEnteredParameter(title: 'Вид горючей нагрузки:', value: widget.coefficient.title),
      ],
    );
  }

  Widget _buildResult() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Результат:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 120,
          child: Text(
            widget.result,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.green),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = ExpressAppBar(
      title: 'Результаты расчета',
      actions: [IconButton(icon: const Icon(Icons.share), onPressed: _share)],
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: appBar,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 25),
          physics: const BouncingScrollPhysics(),
          children: [
            _buildLogo(),
            const SizedBox(height: 30),
            _buildInitialData(),
            const SizedBox(height: 60),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
