import 'package:auto_enterprise/generated/google/protobuf/timestamp.pb.dart';
import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/persons/person_list.dart';
import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:auto_enterprise/repairs/repair_card.dart';
import 'package:auto_enterprise/repairs/repairs_report.dart';
import 'package:auto_enterprise/transport//data_provider/data_provider.dart' as tp;
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/person_service.pb.dart';
import '../generated/transport_service.pb.dart';
import '../transport/transport_list.dart';
import '../utils/category_button.dart';
import '../utils/date_picker.dart';
import '../utils/search_filters/filters.dart';
import '../utils/searchable_list.dart';
import '../utils/selectors/select_button.dart';
import 'detailed_repair.dart';

class RepairScreen extends StatefulWidget {
  final Function onRepairSelected;

  const RepairScreen({Key? key, required this.onRepairSelected}) : super(key: key);

  @override
  RepairScreenState createState() => RepairScreenState();
}

class RepairScreenState extends State<RepairScreen> {
  final dataProvider = DataProvider();
  tp.DataProvider transportProvider = tp.DataProvider();

  late List<RepairWork> repairs;
  late Future<List<RepairWork>?> repairsFuture;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    repairsFuture = dataProvider.getRepairs();
  }

  Widget listOfRepairs() {
    return FutureBuilder<List<RepairWork>?>(
      future: repairsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        repairs = snapshot.data!;
        return Expanded(
            child: Padding(
                padding: EdgeInsets.all(8), child: RepairsList(repairs: repairs, onRepairSelected: onSelectedWrapper)));
      },
    );
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void onSelectedWrapper(transport) {
    widget.onRepairSelected(transport, update);
  }

  void update() {
    setState(() {});
  }

  void addRepair() async {
    RepairWork? newRepair = await Navigator.push(context, CupertinoPageRoute(builder: (context) => EditableRepair()));
    if (newRepair != null) {
      setState(() {
        repairs.add(newRepair);
      });
    }
  }

  void selectFilter() {
    showDialog(
      context: context,
      builder: (context) => FilterDialog(
        onApply: (filter) {
          setState(() {
            repairsFuture = dataProvider.getFilteredRepairs(filter);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addRepair,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            searchWidget(updateSearchQuery),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CategoryButton(
                label: "repairs report",
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) {
                    return const RepairsReport();
                  }));
                },
              ),
              CategoryButton(
                label: "filter",
                onTap: () {
                  selectFilter();
                },
              ),
            ]),
            listOfRepairs(),
          ],
        ));
  }
}

class FilterDialog extends StatefulWidget {
  final Function(RepairWorkFilter) onApply;

  const FilterDialog({Key? key, required this.onApply}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final dataProvider = DataProvider();
  final transportProvider = tp.DataProvider();

  int? personId;
  int? transportId;
  Timestamp? dateFrom;
  Timestamp? dateTo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("filter"),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: SelectButton<Person>(
                label: 'Person ID: ${personId?? "any"}',
                searchableListBuilder: (List<Person> tr) => SearchableList<Person>(
                  items: tr,
                  filterFunction: getFilteredPersons,
                  listOfCardBuilder: (tr, _) => Expanded(
                    child: PersonsListWidget(
                      persons: tr,
                      onSelected: (person) {
                        setState(() {
                          personId = person.id;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ),
                fetchFunction: dataProvider.fetchServicePersonnel,
                onSelected: (Person t) {
                  setState(() {
                    personId = t.id;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: SelectButton<Transport>(
                label: 'Transport ID: ${transportId?? "any"}',
                searchableListBuilder: (List<Transport> tr) => SearchableList<Transport>(
                  items: tr,
                  filterFunction: getFilteredTransports,
                  listOfCardBuilder: (tr, _) => Expanded(
                    child: TransportListWidget(
                      transports: tr,
                      onTransportSelected: (transport) {
                        setState(() {
                          transportId = transport.id;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ),
                fetchFunction: transportProvider.fetchTransports,
                onSelected: (Transport t) {
                  setState(() {
                    transportId = t.id;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
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
            RepairWorkFilter filter = RepairWorkFilter();
            if (dateFrom != null && dateTo != null) {
              filter.dateRange = RepairWorkFilter_DateRange();
              filter.dateRange.dateFrom = dateFrom!;
              filter.dateRange.dateTo = dateTo!;
            }
            if (personId != null) {
              filter.servicePersonnelId = personId!;
            }
            if (transportId != null) {
              filter.transportId = transportId!;
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
