import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function? onPicked;
  final String label;

  const NumberPicker(
      {Key? key,
      required this.onPicked,
      required this.initialValue,
      this.minValue = 0,
      this.maxValue = 100,
      required this.label})
      : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
                width: double.infinity,
                height: 250,
                child: CupertinoPicker(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 30,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      value = index;
                      if (widget.onPicked != null) {
                        widget.onPicked!(value);
                      }
                    });
                  },
                  scrollController: FixedExtentScrollController(initialItem: value),
                  children: List.generate(
                      widget.maxValue - widget.minValue + 1, (index) => Text((index + widget.minValue).toString())),
                ),
              )),
      child: Text("${widget.label}" + value.toString(), style: const TextStyle(fontSize: 16, color: Colors.black54)),
    );
  }
}
