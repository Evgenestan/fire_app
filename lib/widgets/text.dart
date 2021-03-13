import 'package:fire_app/auxiliary/colors.dart';
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
  const HeadingM(this.text, {this.textAlign = TextAlign.start, this.color = textColor});
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

class HeadingS extends StatelessWidget {
  const HeadingS(this.text, {this.textAlign = TextAlign.start, this.color = textColor});
  final String text;
  final TextAlign textAlign;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: color),
    );
  }
}

class TextL extends StatelessWidget {
  const TextL(this.text, {this.textAlign = TextAlign.start, this.color = textColor});
  final String text;
  final TextAlign textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(fontSize: 18, color: color),
    );
  }
}

class TextM extends StatelessWidget {
  const TextM(this.text, {this.textAlign = TextAlign.start, this.color = textColor});
  final String text;
  final TextAlign textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(fontSize: 15, color: color),
    );
  }
}
