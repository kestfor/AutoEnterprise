import 'package:auto_enterprise/generated/transport_service.pb.dart' as ts;
import 'package:auto_enterprise/routes/route_card.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/material.dart';
import '../transport//data_provider/data_provider.dart';
import 'editable_route.dart';

class RouteScreen extends StatefulWidget {
  final Function? onRouteSelected;

  const RouteScreen({super.key, this.onRouteSelected});

  @override
  RouteScreenState createState() => RouteScreenState();
}

class RouteScreenState extends State<RouteScreen> {
  final dataProvider = DataProvider();
  late List<ts.Route> routes;
  Future<List<ts.Route>>? routesFuture;

  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void updateScreen() {
    setState(() {});
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: updateSearchQuery,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchRoutes();
  }

  void fetchRoutes() async {
    routesFuture = dataProvider.fetchRoutes();
  }

  void onSelectedWrapper(route) {
    if (widget.onRouteSelected != null) {
      widget.onRouteSelected!(route, updateScreen);
    }
  }

  void addRoute() async {
    final newRoute = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditableRoute()),
    );
    if (newRoute != null) {
      setState(() {
        routes.add(newRoute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addRoute,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          searchWidget(),
          FutureBuilder<List<ts.Route>>(
              future: routesFuture,
              builder: (BuildContext context, AsyncSnapshot<List<ts.Route>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      showError(context, snapshot.error.toString());
                      return const Expanded(child: Center());
                    } else {
                      routes = snapshot.data!;
                      List<ts.Route> filtered = routes.where((p) {
                        bool matchesSearch =
                            (p.name + p.id.toString()).toLowerCase().contains(searchQuery.toLowerCase());
                        return matchesSearch;
                      }).toList();
                      return RouteListWidget(routes: filtered, onRouteSelected: onSelectedWrapper);
                    }
                }
              })
        ],
      ),
    );
  }
}