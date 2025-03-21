import 'package:flutter/material.dart';

import '../generated/trip_service.pb.dart';
import '../utils/utils.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final Function() onTap;

  TripCard({super.key, required this.trip, required this.onTap});

  Color mainColor = Colors.black;
  Color secondColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.grey.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.directions_bus,
                        size: 24,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Trip ID: ${trip.id}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(height: 1, color: secondColor),
                SizedBox(height: 12),
                Text(
                  "Route ID: ${trip.routeId}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Ограничение текста
                ),
                SizedBox(height: 8),
                Text(
                  "Driver ID: ${trip.driverId}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  "Transport ID: ${trip.transportId}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  "Type: ${trip.type}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Divider(height: 1, color: secondColor),
                SizedBox(height: 12),
                Text(
                  "From: ${getFormatedDateTime(trip.startTime.toDateTime())}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  "To: ${getFormatedDateTime(trip.endTime.toDateTime())}",
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TripListWidget extends StatelessWidget {
  final List<Trip> trips;
  final Function(Trip) onSelected;

  const TripListWidget({super.key, required this.trips, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.6, // Уменьшите или увеличьте, если нужно
          ),
          itemCount: trips.length,
          itemBuilder: (context, index) {
            var trip = trips[index];
            return TripCard(
              trip: trip,
              onTap: () {
                onSelected(trip);
              },
            );
          },
        ),
      ),
    );
  }
}
