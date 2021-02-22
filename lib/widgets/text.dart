import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingL extends StatelessWidget {
  const HeadingL(this.text, {this.textAlign = TextAlign.start});
  final String text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
    );
  }
}

class HeadingM extends StatelessWidget {
  const HeadingM(this.text, {this.textAlign = TextAlign.start, this.color = Colors.black});
  final String text;
  final TextAlign textAlign;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: color),
    );
  }
}

class TextL extends StatelessWidget {
  const TextL(this.text, {this.textAlign = TextAlign.start});
  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 18),
    );
  }
}

class TextM extends StatelessWidget {
  const TextM(this.text, {this.textAlign = TextAlign.start});
  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 15),
    );
  }
}
