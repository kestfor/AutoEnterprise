import 'package:auto_enterprise/generated/transport_service.pb.dart';
import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:auto_enterprise/transport_operations/detailed.dart';
import 'package:auto_enterprise/transport_operations/operation_card.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/google/protobuf/timestamp.pb.dart';
import '../transport/data_provider/data_provider.dart';
import '../utils/category_button.dart';
import '../utils/category_selector.dart';
import '../utils/date_picker.dart';

class OperationsScreen extends StatefulWidget {
  final Function onSelected;

  const OperationsScreen({super.key, required this.onSelected});

  @override
  _OperationsScreenState createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {
  final DataProvider dataProvider = DataProvider();
  late List<TransportOperation> operations = [];
  late Future<List<TransportOperation>> operationsFuture;
  List<String> categories = ["All"] + DataProvider.getOperationsTypes();

  String searchQuery = "";
  String category = "All";

  @override
  void initState() {
    super.initState();
    operationsFuture = dataProvider.fetchTransportOperations();
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void updateScreen() {
    setState(() {});
  }

  void updateCategory(String c) {
    setState(() {
      category = c;
    });
  }

  void onSelectedWrapper(TransportOperation unit) {
    widget.onSelected(unit, updateScreen);
  }

  void addUnit() async {
    TransportOperation? newUnit =
        await Navigator.push(context, CupertinoPageRoute(builder: (context) => TransportOperationEditable()));
    if (newUnit != null) {
      setState(() {
        operations.add(newUnit);
      });
    }
  }

  void selectFilter() {
    showDialog(
      context: context,
      builder: (context) => FilterDialog(
        onApply: (filter) {
          setState(() {
            operationsFuture = dataProvider.fetchTransportOperations(filter: filter);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addUnit,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('transport operations')),
        body: Column(
          children: [
            Row(children: [
              SizedBox(
                  height: 60,
                  width: 295, child: searchWidget(updateSearchQuery)),
              CategoryButton(
                label: "filter",
                onTap: () {
                  selectFilter();
                },
              ),
            ]),
            CategorySelector(
              categories: categories,
              onCategorySelected: updateCategory,
              selectedCategory: category,
            ),
            Expanded(
                child: FutureBuilder<List<TransportOperation>>(
              future: operationsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(""));
                }

                operations = snapshot.data!;

                List<TransportOperation> filtered = getFilteredOperations(searchQuery, operations);
                filtered = getOperationsByCategory(category, filtered);

                return OperationList(operations: filtered, onSelected: onSelectedWrapper);
              },
            )),
          ],
        ));
  }
}

class FilterDialog extends StatefulWidget {
  final Function(OperationFilter) onApply;

  const FilterDialog({Key? key, required this.onApply}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  Timestamp? dateFrom;
  Timestamp? dateTo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("filter"),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                BottomDatePicker(
                  label: const Text("date from"),
                  mode: CupertinoDatePickerMode.dateAndTime,
                  child: Text(dateFrom == null ? "any" : getDateTime(dateFrom!.toDateTime())),
                  onPicked: (date) {
                    setState(() {
                      dateFrom = Timestamp.fromDateTime(date);
                    });
                  },
                ),
                const SizedBox(width: 16),
                BottomDatePicker(
                  label: const Text("date to"),
                  mode: CupertinoDatePickerMode.dateAndTime,
                  child: Text(dateTo == null ? "any" : getDateTime(dateTo!.toDateTime())),
                  onPicked: (date) {
                    setState(() {
                      dateTo = Timestamp.fromDateTime(date);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            OperationFilter filter = OperationFilter();
            if (dateFrom != null && dateTo != null) {
              filter.dateFrom = dateFrom!;
              filter.dateTo = dateTo!;
            }
            widget.onApply(filter);
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
