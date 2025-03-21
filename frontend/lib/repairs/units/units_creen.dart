import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:auto_enterprise/repairs/units/unit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../persons/data_provider/data_provider.dart';
import 'detailed_unit.dart';

class UnitsScreen extends StatefulWidget {
  final Function onSelected;

  const UnitsScreen({super.key, required this.onSelected});

  @override
  _UnitsScreenState createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  final DataProvider dataProvider = DataProvider();
  late List<TransportUnit> units = [];
  late Future<List<TransportUnit>> unitsFuture;

  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    unitsFuture = dataProvider.fetchTransportUnits();
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void updateScreen() {
    setState(() {});
  }

  void onSelectedWrapper(TransportUnit unit) {
    widget.onSelected(unit, updateScreen);
  }

  void addUnit() async {
    TransportUnit? newUnit = await Navigator.push(context, CupertinoPageRoute(builder: (context) => EditableUnit()));
    if (newUnit != null) {
      setState(() {
        units.add(newUnit);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addUnit,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('transport units')),
        body: Column(
          children: [
            searchWidget(updateSearchQuery),
            Expanded(
                child: FutureBuilder<List<TransportUnit>>(
              future: unitsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                units = snapshot.data!;
                return UnitList(units: units, onSelected: onSelectedWrapper);
              },
            )),
          ],
        ));
  }
}
