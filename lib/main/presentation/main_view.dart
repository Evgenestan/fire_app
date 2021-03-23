import 'package:fire_app/auxiliary/constants.dart';
import 'package:fire_app/auxiliary/router.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/info/presentation/info_view.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/main/domain/state/main_state.dart';
import 'package:fire_app/widgets/input/selector.dart';
import 'package:fire_app/widgets/input/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yalo_assets/lib.dart';
import 'package:yalo_locale/lib.dart';

class MainView extends StatefulWidget {
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

  void _openInfo() {
    Navigator.push<dynamic>(
      context,
      CupertinoPageRoute<dynamic>(
        builder: (context) => InfoView(),
      ),
    );
  }

  void _calculate() {
    final result = _mainState.calculate();
    if (result == true) {
      Navigator.of(context).pushNamed(Routes.to.result);
      _mainState.clear();
    }
  }

  void _openHistory() {
    Navigator.of(context).pushNamed(Routes.to.history);
  }

  Widget _buildLogo() {
    return Container(
      width: 150,
      height: 250,
      child: Image.asset(
        Assets.appIconS,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildInputCoefficients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_loc.main.fireTime, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Observer(
          builder: (_) => TextInput(controller: _mainState.timeController, textInputType: TextInputType.number, errorText: _mainState.timeError),
        ),
        const SizedBox(height: 10),
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
    _mainState = MainState(sl<MainRepository>());
    _mainState.init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(icon: const Icon(Icons.info), onPressed: _openInfo),
              ),
              _buildLogo(),
              const SizedBox(height: 15),
              Text(
                _loc.main.description,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              _buildInputCoefficients(),
              const SizedBox(height: 30),
              _buildButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
        floatingActionButton: IconButton(
          icon: const Icon(Icons.history),
          onPressed: _openHistory,
          iconSize: 50,
        ),
      ),
    );
  }
}
