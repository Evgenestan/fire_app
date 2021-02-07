import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
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
