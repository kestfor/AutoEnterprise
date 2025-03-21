import 'package:auto_enterprise/generated/google/protobuf/timestamp.pb.dart';
import 'package:auto_enterprise/repairs/units/unit_card.dart';
import 'package:auto_enterprise/transport/detailed/utils/validate_inputer.dart';
import 'package:auto_enterprise/trips/data_provider/data_provider.dart' as rp;
import 'package:auto_enterprise/utils/date_picker.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/selectors/select_button.dart';
import 'package:auto_enterprise/utils/selectors/selectors.dart';
import 'package:auto_enterprise/utils/stringer.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/person_service.pb.dart';
import '../generated/transport_service.pb.dart';
import '../persons/data_provider/data_provider.dart' as pp;
import '../transport//data_provider/data_provider.dart' as tp;
import '../utils/bottom_category_selector.dart';
import '../utils/searchable_list.dart';

class EditableRepair extends StatefulWidget {
  late RepairWork repair;
  late final RepairWork savedRepair;
  final VoidCallback? onCategoryChanged;

  EditableRepair({super.key, RepairWork? repair, this.onCategoryChanged}) {
    if (repair == null) {
      this.repair = RepairWork();
    } else {
      this.repair = repair;
    }
    savedRepair = this.repair.clone();
  }

  @override
  _EditableRepairState createState() => _EditableRepairState();
}

class _EditableRepairState extends State<EditableRepair> {
  final pp.DataProvider personsProvider = pp.DataProvider();
  final tp.DataProvider transportDataProvider = tp.DataProvider();
  final rp.DataProvider routesDataProvider = rp.DataProvider();

  late Timestamp? startTime = widget.repair.hasStartTime() ? widget.repair.startTime : null;
  late Timestamp? endTime = widget.repair.hasEndTime() ? widget.repair.endTime : null;

  late TextEditingController descriptionController =
      TextEditingController(text: widget.repair.hasDescription() ? widget.repair.description : "");
  late TextEditingController costController =
      TextEditingController(text: widget.repair.hasRepairCost() ? widget.repair.repairCost.toString() : "0");
  GlobalKey<FormFieldState> costKey = GlobalKey<FormFieldState>();

  late String state = widget.repair.hasState() ? widget.repair.state : RepairState.not_started.name;
  late int? personId = widget.repair.hasServicePersonnelId() ? widget.repair.servicePersonnelId : null;
  late int? transportId = widget.repair.hasTransportId() ? widget.repair.transportId : null;
  late int? unitId = widget.repair.hasUnitId() ? widget.repair.unitId : null;

  final List<String> categories = pp.DataProvider.getRepairStates();
  Map<Type, dynamic> detailedData = {};

  @override
  void initState() {
    super.initState();
    DetailedDataReceiver receiver = DetailedDataReceiver();

    Map<Type, int> items = {
      Person: widget.repair.servicePersonnelId,
      Transport: widget.repair.transportId,
      TransportUnit: widget.repair.unitId
    };

    receiver.receiveMany(items).then((value) {
      setState(() {
        detailedData = value;
      });
    });
  }

  bool validate() {
    bool isValid = true;

    if (!costKey.currentState!.validate()) {
      isValid = false;
    }

    return isValid;
  }

  SearchableList<TransportUnit> unitListBuilder(List<TransportUnit> units) {
    return SearchableList<TransportUnit>(
        items: units,
        onItemSelected: (item) {
          Navigator.pop(context, item);
        },
        filterFunction: getFilteredUnits,
        listOfCardBuilder: (units, additional) => Expanded(
            child: UnitList(
                units: units,
                onSelected: (unit) {
                  setState(() {
                    unitId = unit.id;
                    Navigator.pop(context, unit);
                  });
                })));
  }

  void saveChanges() async {
    if (!validate()) {
      return;
    }

    if (startTime != null && endTime != null && endTime!.toDateTime().isBefore(startTime!.toDateTime())) {
      showError(context, "end time must be after start time");
      return;
    }

    if (startTime != null) {
      widget.repair.startTime = startTime!;
    } else {
      showError(context, "start time required");
      return;
    }

    if (endTime != null) {
      widget.repair.endTime = endTime!;
    }

    if (personId != null) {
      widget.repair.servicePersonnelId = personId!;
    }

    if (transportId != null) {
      widget.repair.transportId = transportId!;
    }

    if (unitId != null) {
      widget.repair.unitId = unitId!;
    }

    widget.repair.description = descriptionController.text;
    widget.repair.repairCost = double.parse(costController.text);
    widget.repair.state = formatType(state);

    RepairWork? newRepair;

    bool saved = await saveChangesWrapper(context, () async {
      if (!widget.repair.hasId()) {
        await personsProvider.createRepair(widget.repair);
        newRepair = widget.repair;
      } else {
        await personsProvider.updateRepair(widget.repair);
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newRepair);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Repair')),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Row(children: [
                        BottomDatePicker(
                            label: const Text("Start time"),
                            mode: CupertinoDatePickerMode.dateAndTime,
                            child: startTime != null ? Text(getDateTime(startTime!.toDateTime())) : const Text("any"),
                            onPicked: (date) {
                              setState(() {
                                startTime = Timestamp.fromDateTime(date);
                              });
                            }),
                        const SizedBox(width: 16),
                        BottomDatePicker(
                            label: const Text("End time"),
                            mode: CupertinoDatePickerMode.dateAndTime,
                            child: endTime != null ? Text(getDateTime(endTime!.toDateTime())) : const Text("any"),
                            onPicked: (date) {
                              setState(() {
                                endTime = Timestamp.fromDateTime(date);
                              });
                            }),
                      ]),
                      const SizedBox(height: 16),
                      BottomCategorySelector(
                        categories: categories,
                        currentCategory: state,
                        onTap: (String category) {
                          setState(() {
                            state = category;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        maxLines: 8,
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextValidatorInput(
                          controller: costController,
                          fieldKey: costKey,
                          label: "cost",
                          rule: RegexPattern.floatNumber.regex,
                          inputType: TextInputType.number),
                      const SizedBox(height: 16),
                      Row(children: [
                        transportSelectorButton(context, transportId, transportDataProvider, (Transport transport) {
                          setState(() {
                            detailedData[Transport] = transport;
                            transportId = transport.id;
                          });
                        }, detailedData: detailedData),
                        SizedBox(width: 16),
                        servicePersonnelSelectorButton(context, personId, personsProvider, (Person person) {
                          setState(() {
                            detailedData[Person] = person;
                            personId = person.id;
                          });
                        }, detailedData: detailedData)
                      ]),
                      const SizedBox(height: 16),
                      SizedBox(
                          width: double.infinity,
                          child: SelectButton(
                              onLongPress: () {
                                pushDetailedRoute<TransportUnit>(context, unitId ?? 0);
                              },
                              onSelected: (TransportUnit unit) {
                                print(unit);
                                detailedData[TransportUnit] = unit;
                              },
                              label: "transport unit",
                              text: Stringer(detailedData[TransportUnit]).toString(),
                              searchableListBuilder: unitListBuilder,
                              fetchFunction: personsProvider.fetchTransportUnits)),
                      const SizedBox(height: 16),
                      saveButton(saveChanges)
                    ])))));
  }
}
