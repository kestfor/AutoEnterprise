import 'package:auto_enterprise/transport/transport_card.dart';
import 'package:flutter/cupertino.dart';

import '../generated/transport_service.pb.dart';

class TransportListWidget extends StatelessWidget {
  final List<Transport> transports;
  final Function? onTransportSelected;

  const TransportListWidget({Key? key, required this.transports, this.onTransportSelected}) : super(key: key);

  @override
  Widget build(context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          childAspectRatio: 3,
        ),
        itemCount: transports.length,
        itemBuilder: (context, index) {
          Transport transport = transports[index];
          return TransportCard(
            licencePlate: transport.licensePlate,
            name: transport.name,
            category: transport.type,
            photoUrl: null,
            onTap: () {
              if (onTransportSelected != null) {
                onTransportSelected!(transport);
              }
            },
          );
        },
      ),
    ));
  }
}
