import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:yalo_locale/lib.dart';

class ResultView extends StatefulWidget {
  const ResultView({@required this.time, @required this.coefficient, @required this.result});
  final double time;
  final Coefficient coefficient;
  final String result;
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  final _loc = sl<LocalizationMessages>();
  void _share() {
    Share.share('${_loc.result.fireTime}: ${widget.time} сек.\n${_loc.result.load}: ${widget.coefficient.title}\nРезультат: ${widget.result} (м)');
  }

  Widget _buildEnteredParameter({String title, String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextL(
            title + ':',
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 120,
          child: TextM(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInitialData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _loc.result.initialData,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        _buildEnteredParameter(title: _loc.result.fireTime, value: '${widget.time} сек.'),
        const SizedBox(height: 15),
        _buildEnteredParameter(title: _loc.result.load, value: widget.coefficient.title),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadingL(_loc.result.result),
        const SizedBox(height: 20),
        TextL(_loc.result.descriptions.prefix, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(3)),
          child: HeadingM(
            widget.result + _loc.result.unit,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        TextM(
          _loc.result.descriptions.suffix,
          textAlign: TextAlign.center,
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
      title: _loc.result.title,
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
            _buildInitialData(),
            const SizedBox(height: 50),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
