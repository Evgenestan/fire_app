import 'package:fire_app/constants.dart';
import 'package:fire_app/main/data/model/coefficient.dart';
import 'package:fire_app/main/domain/repository/main_repository.dart';
import 'package:fire_app/main/domain/state/main_state.dart';
import 'package:fire_app/widgets/input/selector.dart';
import 'package:fire_app/widgets/input/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yalo_assets/lib.dart';

class MainView extends StatefulWidget {
  const MainView({@required this.title});
  final String title;
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainState _mainState;

  Future<void> _selectCoefficient() async {
    final test = await showSelector<Coefficient>(items: _mainState.coefficients.map((e) => SelectorItem(title: e.title, value: e)).toList(), context: context);
    print(test?.value);
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 100,
      child: Image.asset(
        Assets.fireIconS,
        color: Colors.black,
        colorBlendMode: BlendMode.color,
      ),
    );
  }

  Widget _buildInputCoefficients() {
    return Column(
      children: [
        TextInput(
          controller: TextEditingController(),
          label: 'Время горения',
        ),
        const SizedBox(height: 15),
        TextInput(
          label: 'Коэффициент',
          onPressed: _selectCoefficient,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _mainState = MainState(GetIt.instance<MainRepository>());
    _mainState.loadCoefficient();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(widget.title),
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
            const SizedBox(height: 15),
            _buildInputCoefficients(),
          ],
        ),
      ),
    );
  }
}
