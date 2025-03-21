import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:flutter/material.dart';

class TransportCard extends StatelessWidget {
  final String licencePlate;
  final String category;
  final String name;
  final String? photoUrl;
  final VoidCallback? onTap;

  const TransportCard({
    super.key,
    required this.name,
    required this.category,
    required this.licencePlate,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: GestureDetector(
            onTap: onTap,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child:Row(
                children: [
                  transportIcon(40, photoUrl),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('model: $name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                      Text('type: $category', style: TextStyle(fontSize: 14, color: Colors.grey), textAlign: TextAlign.left),
                      Text('licence plate: $licencePlate', textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              )),
            )));
  }
}
