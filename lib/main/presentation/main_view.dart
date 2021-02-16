import 'package:fire_app/auxiliary/constants.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/main/domain/state/main_state.dart';
import 'package:fire_app/result/presentation/result_view.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:fire_app/widgets/input/selector.dart';
import 'package:fire_app/widgets/input/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:yalo_assets/lib.dart';
import 'package:yalo_locale/lib.dart';

class MainView extends StatefulWidget {
  const MainView({@required this.title});
  final String title;
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _loc = sl<LocalizationMessages>();

  MainState _mainState;

  Future<void> _selectCoefficient() async {
    final coefficient = await showSelector<Coefficient>(items: _mainState.coefficients.map((e) => SelectorItem(title: e.title, value: e)).toList(), context: context);
    _mainState.setCoefficient(coefficient);
  }

  void _calculate() {
    final result = _mainState.getResultOfCalculated();
    if (result != null) {
      Navigator.push<dynamic>(
        context,
        CupertinoPageRoute<dynamic>(
          builder: (context) => ResultView(time: _mainState.time, coefficient: _mainState.coefficient, result: result),
        ),
      );
    }
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 150,
      child: Image.asset(
        Assets.fireIconS,
      ),
    );
  }

  Widget _buildInputCoefficients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_loc.main.fireTime, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextInput(controller: _mainState.timeController),
        const SizedBox(height: 15),
        Text(_loc.main.typeOfLoad, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextInput(
          readOnly: true,
          controller: _mainState.coefficientController,
          onPressed: _selectCoefficient,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      child: Observer(
        builder: (_) => RaisedButton(
          onPressed: _mainState.canCalculate ? _calculate : null,
          color: Colors.green,
          child: Text(_loc.main.calulate, style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mainState = MainState(GetIt.instance<MainRepository>());
    _mainState.init();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = ExpressAppBar(
      title: widget.title,
      actions: [IconButton(icon: Image.asset(Assets.infoIconS), onPressed: () {})], //TODO: когда будет инфо добавить страницу и переход
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
            _buildInputCoefficients(),
            const SizedBox(height: 30),
            _buildButton(),
          ],
        ),
      ),
    );
  }
}
