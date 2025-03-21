import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/transport_service.pb.dart';

class EditableTram extends StatefulWidget {
  final TramInfo tramInfo;
  final Function() saveTransportChanges;

  EditableTram({super.key, required this.tramInfo, required this.saveTransportChanges});

  @override
  _EditableTramState createState() => _EditableTramState();
}

class _EditableTramState extends State<EditableTram> {
  late int yearsOfManufacture = widget.tramInfo.hasYearsOfManufacture() ? widget.tramInfo.yearsOfManufacture : 0;
  late int passengersNum = widget.tramInfo.hasYearsOfManufacture() ? widget.tramInfo.passengersNum : 0;
  late bool isOperational = widget.tramInfo.hasIsOperational() ? widget.tramInfo.isOperational : false;

  TramInfo get tramInfo => widget.tramInfo;

  @override
  void initState() {
    super.initState();
  }

  void saveChanges() {
    setState(() {
      if (validate()) {
        widget.tramInfo.yearsOfManufacture = yearsOfManufacture;
        widget.tramInfo.passengersNum = passengersNum;
        widget.tramInfo.isOperational = isOperational;
        widget.saveTransportChanges();
      }
    });
  }

  bool validate() {
    bool isValid = true;
    return isValid;
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: NumberPicker(
              onPicked: (value) {
                setState(() {
                  yearsOfManufacture = value;
                });
              },
              initialValue: yearsOfManufacture,
              label: "years of manufacture: ",
              minValue: 0,
              maxValue: 100,
            )),
        const SizedBox(height: 16),
        SizedBox(
            width: double.infinity,
            child: NumberPicker(
              onPicked: (value) {
                setState(() {
                  passengersNum = value;
                });
              },
              initialValue: passengersNum,
              label: "passengers number: ",
              minValue: 0,
              maxValue: 100,
            )),
        const SizedBox(height: 16),
        checkboxTile((value) {
          setState(() {
            isOperational = value;
          });
        }, isOperational, 'operational'),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
