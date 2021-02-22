import 'package:fire_app/auxiliary/constants.dart';
import 'package:fire_app/auxiliary/sl.dart';
import 'package:fire_app/widgets/express_app_bar.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yalo_locale/lib.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loc = sl<LocalizationMessages>();
    return Scaffold(
      appBar: const ExpressAppBar(title: 'О нас'),
      body: ListView(
        padding: const EdgeInsets.all(horizontalPadding),
        children: [const HeadingM('Заголовок'), TextM(_loc.info.loremIpsum)],
      ),
    );
  }
}
