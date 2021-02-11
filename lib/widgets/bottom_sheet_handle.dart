import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, Colors.white.withOpacity(0)]),
      ),
      child: Center(
        child: Container(
          width: 45,
          height: 4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
