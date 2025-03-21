import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/trips/detailed/trip.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/trip_service.pb.dart';

class PassengersTripEditable extends TripEditable {
  PassengersTripEditable(Trip? trip, {Key? key}) : super(trip, key: key);

  @override
  PassengersTripEditableState createState() => PassengersTripEditableState();
}

class PassengersTripEditableState extends TripEditableState {
  TripInfoPassenger get tripInfo => widget.trip.passengers;

  late int passengerNum = tripInfo.hasPassengersNum() ? tripInfo.passengersNum : 0;

  @override
  Widget getDefaultAdditionalInfo() {
    return Row(
      children: [
        Expanded(
            child: NumberPicker(
                onPicked: (value) {
                  setState(() {
                    passengerNum = value;
                  });
                },
                initialValue: passengerNum,
                label: "Passengers num: ")),
      ],
    );
  }

  @override
  void saveChanges() {
    widget.trip.passengers.passengersNum = passengerNum;
    super.saveChanges();
  }
}
