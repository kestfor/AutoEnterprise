

import 'package:auto_enterprise/trips/detailed/passengers_trip.dart';
import 'package:auto_enterprise/trips/detailed/trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/trip_service.pb.dart';
import 'package:provider/provider.dart';

import 'cargo_trip.dart';

class DynamicTripFormScreen extends StatefulWidget {
  final Trip? trip;

  DynamicTripFormScreen({this.trip, super.key});

  @override
  State<DynamicTripFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicTripFormScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formState = Provider.of<TripFormStateModel>(context, listen: false);

      if (!formState.set) {
        if (widget.trip?.type == "cargo") {
          formState.switchForm(CargoTripEditable(widget.trip));
        } else {
          formState.switchForm(PassengersTripEditable(widget.trip));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit trip")),
      body: Consumer<TripFormStateModel>(
        builder: (context, formState, child) {
          return formState.currentForm;
        },
      ),
    );
  }
}
