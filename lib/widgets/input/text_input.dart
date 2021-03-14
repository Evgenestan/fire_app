import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    this.controller,
    this.label,
    this.readOnly = false,
    this.onPressed,
    this.prefixIcon,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.errorText = '',
  });
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final VoidCallback onPressed;
  final Widget prefixIcon;
  final Function(String) onChanged;
  final TextInputType textInputType;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            controller: controller,
            onTap: onPressed,
            keyboardType: textInputType,
            readOnly: readOnly,
            onChanged: onChanged,
            decoration: InputDecoration(contentPadding: const EdgeInsets.fromLTRB(7, 5, 7, 10), border: InputBorder.none, labelText: label, prefixIcon: prefixIcon),
          ),
        ),
        TextM(errorText, color: Colors.red),
      ],
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
    return TextFormField(
      controller: controller,
      onTap: onPressed,
      keyboardType: TextInputType.text,
      readOnly: readOnly,
      decoration: InputDecoration(labelText: label, prefixIcon: prefixIcon, contentPadding: EdgeInsets.zero),
    );
  }
}
