import 'package:flutter/material.dart';
import '../generated/transport_service.pb.dart';

class OperationCard extends StatelessWidget {
  final TransportOperation operation;
  final Function onSelected;

  const OperationCard({Key? key, required this.operation, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(operation),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.request_page, size: 40, color: Colors.green),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Operation ID: ${operation.id}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Type: ${operation.type}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                ],
              ),
              Divider(),
              SizedBox(height: 8),
              Text(
                "Transport ID: ${operation.transportId}",
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                operation.description,
                style: TextStyle(color: Colors.black87),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OperationList extends StatelessWidget {
  final List<TransportOperation> operations;
  final Function onSelected;

  const OperationList({Key? key, required this.operations, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: operations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: OperationCard(operation: operations[index], onSelected: onSelected),
        );
      },
    );
  }
}