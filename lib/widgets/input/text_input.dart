import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({this.controller, this.label, this.readOnly = false, this.onPressed, this.prefixIcon});
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final VoidCallback onPressed;
  final Widget prefixIcon;
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
        keyboardType: TextInputType.number,
        readOnly: readOnly,
        decoration: InputDecoration(contentPadding: const EdgeInsets.all(5), border: InputBorder.none, labelText: label, prefixIcon: prefixIcon),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({this.controller, this.label, this.readOnly = false, this.onPressed, this.prefixIcon});
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final VoidCallback onPressed;
  final Widget prefixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        onTap: onPressed,
        keyboardType: TextInputType.text,
        readOnly: readOnly,
        decoration: InputDecoration(labelText: label, prefixIcon: prefixIcon, contentPadding: EdgeInsets.zero),
      ),
    );
  }
}
