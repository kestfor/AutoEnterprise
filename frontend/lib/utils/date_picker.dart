import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDatePicker extends StatelessWidget {
  final Function? onPicked;
  final Widget child;
  final Widget? label;
  final CupertinoDatePickerMode mode;

  const BottomDatePicker({required this.child, this.onPicked, super.key, this.label, required this.mode});

  @override
  Widget build(context) {
    return Expanded(
        child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showModalBottomSheet(
                builder: (_) {
                  return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: CupertinoDatePicker(
                          itemExtent: 30,
                          mode: mode,
                          onDateTimeChanged: (date) {
                            if (onPicked != null) {
                              onPicked!(date);
                            }
                          }));
                },
                context: context,
              );

              if (pickedDate != null && onPicked != null) {
                onPicked!(pickedDate);
              }
            },
            child: InputDecorator(
                decoration: InputDecoration(
                  label: label,
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                child: child)));
  }
}
