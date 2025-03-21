import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String? text;

  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextFormField(
        showCursor: false,
        controller: TextEditingController(text: text),
        onTap: onPressed,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      ),
      Positioned.fill(
          child: Material(color: Colors.transparent, child: InkWell(onLongPress: onLongPress, onTap: onPressed))),
    ]);
  }
}
