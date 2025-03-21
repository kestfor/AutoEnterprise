import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/person_list.dart';
import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/stringer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/notifications/notification.dart';
import '../../../utils/searchable_list.dart';
import '../../../utils/utils.dart';

class EditableMaster extends StatefulWidget {
  final MasterInfo masterInfo;
  final Function() savePersonChanges;

  EditableMaster({super.key, required this.masterInfo, required this.savePersonChanges});

  @override
  _EditableMasterState createState() => _EditableMasterState();
}

class _EditableMasterState extends State<EditableMaster> {
  final pp.DataProvider personProvider = pp.DataProvider();

  MasterInfo get masterInfo => widget.masterInfo;
  Map<Type, dynamic> detailedData = {};

  @override
  void initState() {
    super.initState();

    DetailedDataReceiver receiver = DetailedDataReceiver();

    Map<Type, int> itemsToReceive = {Person: widget.masterInfo.managerId};

    receiver.receiveMany(itemsToReceive).then((value) {
      setState(() {
        detailedData = value;
      });
    });
  }

  void saveChanges() {
    setState(() {
      widget.savePersonChanges();
    });
  }

  void selectManager(context, dataProvider, masterInfo) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Person> persons = [];

    try {
      persons = await dataProvider.fetchPersons();
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    persons = persons.where((element) => element.role == Role.manager.name).toList();

    Person? person = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Select Person')),
          body: SearchableList<Person>(
            items: persons,
            listOfCardBuilder: (persons, additional) => PersonsListWidget(
                persons: persons,
                onSelected: (person) {
                  Navigator.pop(context, person);
                }),
            filterFunction: getFilteredPersons,
          ));
    }));
    if (person != null) {
      setState(() {
        detailedData[Person] = person;
        widget.masterInfo.managerId = person.id;
      });
    }
  }

  Widget managerSelectorButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomOutlinedButton(
          onPressed: () async {
            selectManager(context, personProvider, widget.masterInfo);
          },
          onLongPress: () {
            pushDetailedRoute<Person>(context, widget.masterInfo.managerId);
          },
          label: "manager",
          text: Stringer(detailedData[Person]).toString()),
    );
  }

  @override
  Widget build(context) {
    return Column(
      children: [managerSelectorButton(), const SizedBox(height: 16), saveButton(saveChanges)],
    );
  }
}
