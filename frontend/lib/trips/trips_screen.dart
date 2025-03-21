import 'package:auto_enterprise/trips/trip_card.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/trip_service.pb.dart';
import '../../persons/persons_screen.dart';
import '../../utils/notifications/notification.dart';
import '../generated/google/protobuf/timestamp.pb.dart';
import '../generated/transport_service.pb.dart';
import '../transport/transport_list.dart';
import '../utils/category_button.dart';
import '../utils/date_picker.dart';
import '../utils/searchable_list.dart';
import '../utils/selectors/select_button.dart';
import 'data_provider/data_provider.dart';
import 'detailed/dynamic_form.dart';
import 'detailed/trip.dart';
import 'package:auto_enterprise/transport/data_provider/data_provider.dart' as tdp;

class TripsScreen extends StatefulWidget {
  final Function? onSelected;

  const TripsScreen({super.key, this.onSelected});

  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final dataProvider = DataProvider();
  final List<String> categories = ["All"] + DataProvider.getTypes();

  List<Trip> trips = [];
  Future<List<Trip>>? tripFuture;

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

  void update() {
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
    fetchTrips();
  }

  void fetchTrips() async {
    tripFuture = dataProvider.fetchTrips();
  }

  void addTrip() async {
    final newTrip = await Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => TripFormStateModel(),
                child: DynamicTripFormScreen(),
              )),
    );
    if (newTrip != null) {
      setState(() {
        trips.add(newTrip);
      });
    }
  }

  void selectFilter() {
    showDialog(
      context: context,
      builder: (context) => FilterDialog(
        onApply: (filter) {
          setState(() {
            tripFuture = dataProvider.fetchFilteredTrips(filter);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addTrip,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(children: [SizedBox(
              width: 295,
              height: 60,
              child: searchWidget()), CategoryButton(
            label: "filter",
            onTap: () {
              selectFilter();
            },
          ),]),
          CategorySelector(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: updateCategory,
          ),
          FutureBuilder<List<Trip>>(
              future: tripFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Trip>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      showError(context, snapshot.error.toString());
                      return const Expanded(child: Center());
                    } else {
                      var tripsData = snapshot.data!;
                      trips = tripsData;
                      List<Trip> filteredTrips = getFilteredTrips(searchQuery, trips);
                      filteredTrips = getTripsByCategory(selectedCategory, filteredTrips);
                      return TripListWidget(trips: filteredTrips, onSelected: (trip) {
                        if (widget.onSelected != null) {
                          widget.onSelected!(trip, update);
                        }
                      });
                    }
                }
              })
        ],
      ),
    );
  }
}



class FilterDialog extends StatefulWidget {
  final Function(TripFilter) onApply;
  const FilterDialog({Key? key, required this.onApply}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final dataProvider = DataProvider();
  final transportData = tdp.DataProvider();

  int? transportId;
  Timestamp? dateFrom;
  Timestamp? dateTo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("filter"),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: SelectButton<Transport>(
                label: 'Transport ID: ${transportId?? "any"}',
                searchableListBuilder: (List<Transport> tr) => SearchableList<Transport>(
                  items: tr,
                  filterFunction: getFilteredTransports,
                  listOfCardBuilder: (tr, _) => Expanded(
                    child: TransportListWidget(
                      transports: tr,
                      onTransportSelected: (transport) {
                        setState(() {
                          transportId = transport.id;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ),
                fetchFunction: transportData.fetchTransports,
                onSelected: (Transport t) {
                  setState(() {
                    transportId = t.id;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                BottomDatePicker(
                  label: const Text("date from"),
                  mode: CupertinoDatePickerMode.dateAndTime,
                  child: Text(dateFrom == null ? "any" : getDateTime(dateFrom!.toDateTime())),
                  onPicked: (date) {
                    setState(() {
                      dateFrom = Timestamp.fromDateTime(date);
                    });
                  },
                ),
                const SizedBox(width: 16),
                BottomDatePicker(
                  label: const Text("date to"),
                  mode: CupertinoDatePickerMode.dateAndTime,
                  child: Text(dateTo == null ? "any" : getDateTime(dateTo!.toDateTime())),
                  onPicked: (date) {
                    setState(() {
                      dateTo = Timestamp.fromDateTime(date);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            TripFilter filter = TripFilter();
            if (dateFrom != null) {
              filter.dateFrom = dateFrom!;
            }

            if (dateTo != null) {
              filter.dateTo = dateTo!;
            }
            if (transportId != null) {
              filter.transportId = transportId!;
            }
            widget.onApply(filter);
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}