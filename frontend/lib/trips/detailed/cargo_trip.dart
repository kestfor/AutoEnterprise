

import 'package:auto_enterprise/trips/detailed/trip.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/trip_service.pb.dart';
import '../../../persons/detailed/types/utils/utils.dart';
import '../../../transport/detailed/utils/validate_inputer.dart';

class CargoTripEditable extends TripEditable {

  CargoTripEditable(Trip? trip, {super.key}) : super(trip);

  @override
  CargoTripEditableState createState() => CargoTripEditableState();
}

class CargoTripEditableState extends TripEditableState {
  late TextEditingController cargoType = TextEditingController(text: tripInfo.hasCargoType() ? tripInfo.cargoType : "");
  late TextEditingController cargoWeight =
      TextEditingController(text: tripInfo.hasCargoWeight() ? tripInfo.cargoWeight.toString() : "");
  late TextEditingController cargoName = TextEditingController(text: tripInfo.hasCargoName() ? tripInfo.cargoName : "");
  late TextEditingController cargoCost =
      TextEditingController(text: tripInfo.hasCargoCost() ? tripInfo.cargoCost.toString() : "");

  late Map<TextEditingController, GlobalKey<FormFieldState>> keys = {
    cargoWeight: GlobalKey<FormFieldState>(),
    cargoCost: GlobalKey<FormFieldState>(),
  };

  TripInfoCargo get tripInfo => widget.trip.cargo;

  bool validate() {
    bool valid = true;
    for (var key in keys.values) {
      if (!key.currentState!.validate()) {
        valid = false;
      }
    }

    return valid;
  }

  @override
  void saveChanges() {
    if (validate()) {
      widget.trip.cargo = TripInfoCargo(
        cargoType: cargoType.text,
        cargoWeight: double.parse(cargoWeight.text),
        cargoCost: double.parse(cargoCost.text),
      );

      if (cargoName.text.isNotEmpty) {
        widget.trip.cargo.cargoName = cargoName.text;
      }

      if (cargoType.text.isNotEmpty) {
        widget.trip.cargo.cargoType = cargoType.text;
      }

      print(widget.trip);
      super.saveChanges();
    }
  }

  @override
  Widget getDefaultAdditionalInfo() {
    return Column(
      children: [
        Row(
          children: [
            defaultTextField(cargoType, 'cargo type', expanded: true),
            const SizedBox(width: 10),
            Expanded(
                child: TextValidatorInput(
              fieldKey: keys[cargoWeight]!,
              controller: cargoWeight,
              label: "weight",
              rule: RegexPattern.floatNumber.regex,
            ))
          ],
        ),
        const SizedBox(height: 10),
            SizedBox(
                child: TextValidatorInput(
              fieldKey: keys[cargoCost]!,
              controller: cargoCost,
              label: "cost",
              rule: RegexPattern.floatNumber.regex,
            )),
        const SizedBox(height: 10),
        SizedBox(width: double.infinity, child: defaultTextField(cargoName, 'Cargo name', expanded: false)),
      ],
    );
  }
}
