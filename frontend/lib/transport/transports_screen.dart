import 'package:auto_enterprise/transport/drivers_distribution_report.dart';
import 'package:auto_enterprise/transport/mileage_report.dart';
import 'package:auto_enterprise/transport/passenger_transport_onroute_report.dart';
import 'package:auto_enterprise/transport/transport_distribution_report.dart';
import 'package:auto_enterprise/transport/transport_list.dart';
import 'package:auto_enterprise/utils/category_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../generated/transport_service.pb.dart';
import '../persons/persons_screen.dart';
import './data_provider/data_provider.dart';
import 'detailed/detailed_transport.dart';

class TransportScreen extends StatefulWidget {
  final Function? onTransportSelected;

  const TransportScreen({super.key, this.onTransportSelected});

  @override
  TransportScreenState createState() => TransportScreenState();
}

class TransportScreenState extends State<TransportScreen> {
  final dataProvider = DataProvider();
  final List<String> categories = ["All"] + DataProvider.getTypes();
  late List<Transport> transports = [];
  Future<List<Transport>>? transportsFuture;
  int transportNum = 0;

  String selectedCategory = 'All';
  String searchQuery = '';

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
    fetchTransports();
  }

  void fetchTransports() async {
    transportsFuture = dataProvider.fetchTransports();
  }

  void onSelectedWrapper(transport) {
    if (widget.onTransportSelected != null) {
      widget.onTransportSelected!(transport, updateScreen);
    }
  }

  void addTransport() async {
    final newTransport = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditableTransport()),
    );
    if (newTransport != null) {
      setState(() {
        transports.add(newTransport);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addTransport,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(children: [SizedBox(
              width: 295,
              height: 60,
              child: searchWidget()), CategoryButton(
            label: transportNum.toString()
          ),]),
          CategorySelector(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: updateCategory,
          ),
          SizedBox(
              height: 50,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                CategoryButton(
                  label: "mileage report",
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return const MileageReport();
                    }));
                  },
                ),
                CategoryButton(
                  label: "transport garages",
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return const TransportDistributionReport();
                    }));
                  },
                ),
                CategoryButton(
                  label: "distribution of drivers among cars",
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return const DriversDistributionReport();
                    }));
                  },
                ),
                CategoryButton(
                  label: "distribution of passenger transport",
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return const PassengerTransportDistributionOnRouteReport();
                    }));
                  },
                ),
              ])),
          FutureBuilder<List<Transport>>(
              future: transportsFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Transport>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        toastification.show(
                          alignment: Alignment.bottomCenter,
                          context: context,
                          style: ToastificationStyle.fillColored,
                          type: ToastificationType.error,
                          title: Text(snapshot.error.toString()),
                          autoCloseDuration: const Duration(seconds: 3),
                          showProgressBar: false,
                        );
                      });
                      return const Center();
                    } else {
                      transports = snapshot.data!;
                      List<Transport> filtered = transports.where((p) {
                        bool matchesCategory = selectedCategory == 'All' || p.type == selectedCategory;
                        bool matchesSearch =
                            (p.name + p.brand + p.licensePlate).toLowerCase().contains(searchQuery.toLowerCase());
                        return matchesCategory && matchesSearch;
                      }).toList();
                      Future.delayed(Duration(milliseconds: 100), () {
                        if (!context.mounted) {
                          return;
                        }
                        setState(() {
                          transportNum = filtered.length;
                        });
                      });
                      return TransportListWidget(transports: filtered, onTransportSelected: onSelectedWrapper);
                    }
                }
              })
        ],
      ),
    );
  }
}
