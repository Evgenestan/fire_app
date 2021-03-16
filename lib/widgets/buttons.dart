import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({this.onPressed, this.title, this.color = Colors.grey, this.child});
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white, backgroundColor: color, textStyle: const TextStyle(fontSize: 24)),
        child: child ??
            Text(
              title,
            ),
      ),
    );
  }
}
