import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/transport_service.pb.dart';

class EditableTrolleybus extends StatefulWidget {
  final TrolleybusInfo trolleybusInfo;
  final Function() saveTransportChanges;

  EditableTrolleybus({super.key, required this.trolleybusInfo, required this.saveTransportChanges});

  @override
  _EditableTrolleybusState createState() => _EditableTrolleybusState();
}

class _EditableTrolleybusState extends State<EditableTrolleybus> {
  late int yearsOfManufacture = widget.trolleybusInfo.hasYearsOfManufacture() ? widget.trolleybusInfo.yearsOfManufacture : 0;
  late int passengersNum = widget.trolleybusInfo.hasYearsOfManufacture() ? widget.trolleybusInfo.passengersNum : 0;
  late bool isOperational = widget.trolleybusInfo.hasIsOperational() ? widget.trolleybusInfo.isOperational : false;

  TrolleybusInfo get trolleybusInfo => widget.trolleybusInfo;

  @override
  void initState() {
    super.initState();
  }

  void saveChanges() {
    setState(() {
      if (validate()) {
        widget.trolleybusInfo.yearsOfManufacture = yearsOfManufacture;
        widget.trolleybusInfo.passengersNum = passengersNum;
        widget.trolleybusInfo.isOperational = isOperational;
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
