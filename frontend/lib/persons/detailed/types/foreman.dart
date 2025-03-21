import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/persons/person_list.dart';
import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/notifications/notification.dart';
import '../../../utils/searchable_list.dart';
import '../../../utils/stringer.dart';
import '../../../utils/utils.dart';

class EditableForeman extends StatefulWidget {
  final ForemanInfo foremanInfo;
  final Function() savePersonChanges;

  EditableForeman({super.key, required this.foremanInfo, required this.savePersonChanges});

  @override
  _EditableForemanState createState() => _EditableForemanState();
}

class _EditableForemanState extends State<EditableForeman> {
  final TextEditingController serviceCenter = TextEditingController();
  final TextEditingController certification = TextEditingController();
  final pp.DataProvider personProvider = pp.DataProvider();

  ForemanInfo get foremanInfo => widget.foremanInfo;

  Map<Type, dynamic> detailedData = {};

  @override
  void initState() {
    serviceCenter.text = foremanInfo.serviceCenter;
    certification.text = foremanInfo.certification;
    super.initState();
    DetailedDataReceiver receiver = DetailedDataReceiver();

    Map<Type, int> itemsToReceive = {Person: widget.foremanInfo.masterId};

    receiver.receiveMany(itemsToReceive).then((value) {
      setState(() {
        detailedData = value;
      });
    });
  }

  void saveChanges() {
    setState(() {
      foremanInfo.serviceCenter = serviceCenter.text;
      foremanInfo.certification = certification.text;
      widget.savePersonChanges();
    });
  }

  void selectMaster(context, dataProvider, foremanInfo) async {
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

    persons = persons.where((element) => element.role == Role.master.name).toList();

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
        widget.foremanInfo.masterId = person.id;
      });
    }
  }

  Widget masterSelectorButton() {
    var id = widget.foremanInfo.hasMasterId() ? widget.foremanInfo.masterId.toString() : "null";
    return SizedBox(
      width: double.infinity,
      child: CustomOutlinedButton(
        onPressed: () async {
          selectMaster(context, personProvider, widget.foremanInfo);
        },
        onLongPress: () {
          pushDetailedRoute<Person>(context, widget.foremanInfo.masterId);
        },
        text: Stringer(detailedData[Person]).toString(),
        label: 'master',
      ),
    );
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        masterSelectorButton(),
        const SizedBox(height: 16),
        defaultTextField(serviceCenter, "service center", expanded: false),
        const SizedBox(height: 16),
        defaultTextField(certification, "certification", expanded: false),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
