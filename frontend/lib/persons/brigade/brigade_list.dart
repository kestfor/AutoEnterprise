import 'package:auto_enterprise/generated/person_service.pb.dart';
import 'package:flutter/material.dart';

class BrigadesListWidget extends StatelessWidget {
  final List<Brigade> brigades;
  final Function? onSelected;

  const BrigadesListWidget({Key? key, required this.brigades, this.onSelected}) : super(key: key);

  @override
  Widget build(context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var brigade = brigades[index];
          return Card(
              child: ListTile(
            title: Text(brigade.name),
            onTap: () {
              if (onSelected != null) {
                onSelected!(brigade);
              }
            },
          ));
        },
        itemCount: brigades.length,
      ),
    ));
  }
}
