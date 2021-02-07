import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({this.controller, this.label, this.readOnly, this.onPressed});
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        controller: controller,
        onTap: onPressed,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }
}
