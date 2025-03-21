import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/transport_service.pb.dart';

class EditableTaxi extends StatefulWidget {
  final TaxiInfo taxiInfo;
  final Function() saveTransportChanges;

  EditableTaxi({super.key, required this.taxiInfo, required this.saveTransportChanges});

  @override
  _EditableTaxiState createState() => _EditableTaxiState();
}

class _EditableTaxiState extends State<EditableTaxi> {
  var fuelTypes = ["diesel", "gasoline", "electric"];

  late bool isAvailable = widget.taxiInfo.hasIsAvailable() ? widget.taxiInfo.isAvailable : false;
  late int yearsOfManufacture = widget.taxiInfo.hasYearsOfManufacture() ? widget.taxiInfo.yearsOfManufacture : 0;
  late String fuelType = (widget.taxiInfo.hasFuelType() && fuelTypes.contains(widget.taxiInfo.fuelType))
  ? widget.taxiInfo.fuelType
      : fuelTypes[0];

  TaxiInfo get taxiInfo => widget.taxiInfo;

  @override
  void initState() {
    super.initState();
  }

  void saveChanges() {
    setState(() {
      widget.taxiInfo.yearsOfManufacture = yearsOfManufacture;
      if (fuelType != "") {
        widget.taxiInfo.fuelType = fuelType;
      }
      widget.taxiInfo.isAvailable = isAvailable;
      widget.saveTransportChanges();
    });
  }

  void updateCategory(String category) {
    setState(() {
      fuelType = category;
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
                categories: fuelTypes,
                onTap: updateCategory,
                label: const Text("type"),
                currentCategory: fuelType),
        const SizedBox(height: 16),
        checkboxTile((value) {
          setState(() {
            isAvailable = value;
          });
        }, isAvailable, "available"),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
