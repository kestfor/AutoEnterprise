import 'package:auto_enterprise/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../notifications/notification.dart';
import '../searchable_list.dart';

class SelectButton<T> extends StatelessWidget {
  final String? text;
  final String? label;
  final Function? onSelected;
  final Function? onLongPress;
  final SearchableList<T> Function(List<T>) searchableListBuilder;
  final Future<List<T>> Function() fetchFunction;

  const SelectButton(
      {Key? key,
      this.label,
      this.text,
      this.onSelected,
      this.onLongPress,
      required this.searchableListBuilder,
      required this.fetchFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        performSelect(context, fetchFunction, onSelected);
      },
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!();
        }
      },
      label: label,
      text: text,
    );
  }

  void performSelect(context, Future<List<T>> Function() fetchFunction, Function? onSelected) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<T> data = [];

    try {
      data = await fetchFunction();
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    print("here");
    T? item = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Select Item')),
        body: searchableListBuilder(data),
      );
    }));
    print(item);
    if (item != null && onSelected != null) {
      print("here2");
      onSelected(item);
    }
  }
}
