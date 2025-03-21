import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/transport_service.pb.dart';

class EditableBus extends StatefulWidget {
  final BusInfo busInfo;
  final Function() saveTransportChanges;

  EditableBus({super.key, required this.busInfo, required this.saveTransportChanges});

  @override
  _EditableBusState createState() => _EditableBusState();
}

class _EditableBusState extends State<EditableBus> {
  late int passengersNum;

  BusInfo get busInfo => widget.busInfo;

  @override
  void initState() {
    super.initState();
    passengersNum = busInfo.hasPassengersNum() ? busInfo.passengersNum : 0;
  }

  void saveChanges() {
    setState(() {
      busInfo.passengersNum = passengersNum;
      widget.saveTransportChanges();
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child:NumberPicker(
              onPicked: (value) {
                setState(() {
                  passengersNum = value;
                });
              },
              initialValue: passengersNum,
              label: "passengers number: ",
              minValue: 0,
              maxValue: 1000,
            )),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
