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
      appBar: const ExpressAppBar(title: 'Информация'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 25),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextM(_loc.info.start.first),
              TextM(_loc.info.start.second),
              TextM(_loc.info.start.third),
              TextM(_loc.info.start.fourth),
              TextM(_loc.info.start.fifth),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextM(_loc.info.params.first),
                TextM(_loc.info.params.second),
                TextM(_loc.info.params.third),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextM(_loc.info.middle.first),
              TextM(_loc.info.middle.second),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextM(_loc.info.initialData.first),
                TextM(_loc.info.initialData.second),
                TextM(_loc.info.initialData.third),
                TextM(_loc.info.initialData.fourth),
              ],
            ),
          ),
          TextM(_loc.info.end),
        ],
      ),
    );
  }
}
