import 'package:flutter/material.dart';
enum RegexPattern {
  ruPhone(r'^(?:\+7|8)?\d{10}$'),
  email(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
  floatNumber(r'^[+-]?([0-9]*[.])?[0-9]+$');

  final String pattern;
  const RegexPattern(this.pattern);

  RegExp get regex => RegExp(pattern);
}

class TextValidatorInput extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  final String label;
  late final String onEmptyMessage;
  late final String onNotCorrectMessage;
  late final InputDecoration decoration;
  late final TextInputType inputType;
  final RegExp rule;

  TextValidatorInput(
      {Key? key,
      required this.controller,
      required this.fieldKey,
      required this.label,
      required this.rule,
      String? onEmptyMessage,
      String? onNotCorrectMessage,
      InputDecoration? decoration,
      TextInputType? inputType})
      : super(key: key) {
    this.onEmptyMessage = onEmptyMessage ?? "required";
    this.onNotCorrectMessage = onNotCorrectMessage ?? "type error";
    this.decoration = decoration ?? _defaultDecoration(label);
    this.inputType = inputType?? _defaultTextInputType();
  }

  InputDecoration _defaultDecoration(label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  TextInputType _defaultTextInputType() {
    return const TextInputType.numberWithOptions(decimal: true);
  }

  String? _validateFloat(String? value) {
    if (value == null || value.isEmpty) {
      return onEmptyMessage;
    }
    if (!rule.hasMatch(value)) {
      return onNotCorrectMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      keyboardType: inputType,
      decoration: decoration,
      validator: _validateFloat,
    );
  }
}
