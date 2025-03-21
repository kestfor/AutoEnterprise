import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/transport/detailed/utils/validate_inputer.dart';
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/transport_service.pb.dart';

class EditableTruck extends StatefulWidget {
  final TruckInfo truckInfo;
  final Function() saveTransportChanges;

  EditableTruck({super.key, required this.truckInfo, required this.saveTransportChanges});

  @override
  _EditableTruckState createState() => _EditableTruckState();
}

class _EditableTruckState extends State<EditableTruck> {
  var truckTypes = ["dump truck", "van", "pickup truck"];
  late TextEditingController cargoCapacity = TextEditingController(text: widget.truckInfo.cargoCapacityKg.toString());
  late int yearsOfManufacture = widget.truckInfo.hasYearsOfManufacture() ? widget.truckInfo.yearsOfManufacture : 0;
  late TextEditingController fuelConsumption = TextEditingController(text: widget.truckInfo.fuelConsumption.toString());
  late String truckType = widget.truckInfo.hasTruckType() && truckTypes.contains(widget.truckInfo.truckType)
      ? widget.truckInfo.truckType
      : truckTypes[0];

  late Map<TextEditingController, GlobalKey<FormFieldState>> keys = {
    cargoCapacity: GlobalKey<FormFieldState>(),
    fuelConsumption: GlobalKey<FormFieldState>(),
  };

  TruckInfo get truckInfo => widget.truckInfo;

  @override
  void initState() {
    super.initState();
  }

  void saveChanges() {
    setState(() {
      if (validate()) {
        widget.truckInfo.yearsOfManufacture = yearsOfManufacture;
        widget.truckInfo.cargoCapacityKg = double.parse(cargoCapacity.text);
        widget.truckInfo.fuelConsumption = double.parse(fuelConsumption.text);
        widget.truckInfo.truckType = truckType;
        widget.saveTransportChanges();
      }
    });
  }

  bool validate() {
    bool isValid = true;

    for (var key in keys.values) {
      if (!(key.currentState?.validate() ?? false)) {
        isValid = false;
      }
    }

    return isValid;
  }

  void updateCategory(String category) {
    setState(() {
      truckType = category;
    });
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
        BottomCategorySelector(
            categories: truckTypes, onTap: updateCategory, label: const Text("type"), currentCategory: truckType),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
            child: TextValidatorInput(
              controller: cargoCapacity,
              fieldKey: keys[cargoCapacity]!,
              label: 'cargo capacity',
              rule: RegexPattern.floatNumber.regex,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: TextValidatorInput(
                  rule: RegexPattern.floatNumber.regex,
                  controller: fuelConsumption,
                  fieldKey: keys[fuelConsumption]!,
                  label: 'fuel consumption')),
        ]),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
