import 'package:flutter/material.dart';

import '../generated/transport_service.pb.dart' as ts;

class RouteCard extends StatelessWidget {
  final ts.Route route;
  final Function onRouteSelected;

  const RouteCard({Key? key, required this.route, required this.onRouteSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onRouteSelected(route),
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // gradient: LinearGradient(
              //   colors: [Colors.blue.shade500, Colors.blue.shade800],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.route,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            route.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(height: 1, color: Colors.black.withOpacity(0.3)),
                SizedBox(height: 12),
                Text(
                  "ID: ${route.id}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}

class RouteListWidget extends StatelessWidget {
  final List<ts.Route> routes;
  final Function onRouteSelected;

  const RouteListWidget({Key? key, required this.routes, required this.onRouteSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RouteCard(route: routes[index], onRouteSelected: onRouteSelected),
          );
        },
      ),
    );
  }
}
