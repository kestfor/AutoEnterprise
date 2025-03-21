import 'dart:developer';

import 'package:auto_enterprise/generated/transport_service.pb.dart';
import 'package:auto_enterprise/transport/detailed/types/bus.dart';
import 'package:auto_enterprise/transport/detailed/types/taxi.dart';
import 'package:auto_enterprise/transport/detailed/types/tram.dart';
import 'package:auto_enterprise/transport/detailed/types/trolleybus.dart';
import 'package:auto_enterprise/transport/detailed/types/truck.dart';
import 'package:flutter/material.dart';

class EmptyEditableAdditionalInfo extends StatelessWidget {
  final VoidCallback saveChanges;

  const EmptyEditableAdditionalInfo({super.key, required this.saveChanges});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: ElevatedButton(onPressed: saveChanges, child: const Text('Save Changes')));
  }
}

final Map<String, Widget Function(Transport, VoidCallback)> mapping = {
  TransportType.bus.name: (Transport transport, VoidCallback onSave) =>
      EditableBus(busInfo: transport.busInfo, saveTransportChanges: onSave),
  TransportType.tram.name: (Transport transport, VoidCallback onSave) =>
      EditableTram(tramInfo: transport.tramInfo, saveTransportChanges: onSave),
  TransportType.taxi.name: (Transport transport, VoidCallback onSave) =>
      EditableTaxi(taxiInfo: transport.taxiInfo, saveTransportChanges: onSave),
  TransportType.trolleybus.name: (Transport transport, VoidCallback onSave) =>
      EditableTrolleybus(trolleybusInfo: transport.trolleybusInfo, saveTransportChanges: onSave),
  TransportType.truck.name: (Transport transport, VoidCallback onSave) =>
      EditableTruck(truckInfo: transport.truckInfo, saveTransportChanges: onSave),
};

Widget additionalInfoWidget(Transport transport, VoidCallback onSave) {
  final widgetBuilder = mapping[transport.type];
  if (widgetBuilder == null) {
    log("No mapping found for role ${transport.type}");
    return EmptyEditableAdditionalInfo(saveChanges: onSave);
  }
  return widgetBuilder(transport, onSave);
}
