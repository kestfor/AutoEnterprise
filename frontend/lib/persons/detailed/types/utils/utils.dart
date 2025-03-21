import 'package:flutter/material.dart';

Widget defaultTextField(controller, label, {expanded = true}) {
  if (expanded) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  } else {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

Widget checkboxTile(Function onChanged, bool isChecked, String label) {
  return CheckboxListTile(
    title: Text(label),
    value: isChecked,
    onChanged: (value) {
      onChanged(value);
    },
    controlAffinity: ListTileControlAffinity.leading,
  );
}
