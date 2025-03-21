import 'package:auto_enterprise/transport/data_provider/data_provider.dart';
import 'package:auto_enterprise/transport/garage/detailed_garage.dart';
import 'package:auto_enterprise/transport/garage/garage_list.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/material.dart';

import '../../generated/transport_service.pb.dart';
import '../../persons/persons_screen.dart';
import '../../persons/utils/utils.dart';
import '../../utils/utils.dart';

class GarageScreen extends StatefulWidget {
  final Function? onGarageSelected;

  const GarageScreen({Key? key, this.onGarageSelected}) : super(key: key);

  @override
  GarageScreenState createState() {
    return GarageScreenState();
  }
}

class GarageScreenState extends State<GarageScreen> {
  final DataProvider dataProvider = DataProvider();
  final List<String> types = ["All"] + DataProvider.getGarageTypes();
  List<GarageFacility> garages = [];
  late Future<List<GarageFacility>> garagesFuture;

  @override
  void initState() {
    super.initState();
    garagesFuture = dataProvider.fetchGarages();
  }

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

  void wrappedOnTap(GarageFacility garage) {
    if (widget.onGarageSelected != null) {
      widget.onGarageSelected!(garage, updateScreen);
    }
  }

  void addGarage() async {
    final newTransport = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditableGarageFacility()),
    );
    if (newTransport != null) {
      setState(() {
        garages.add(newTransport);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> formatedTypes = [];
    for (var type in types) {
      formatedTypes.add(formatType(type));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addGarage,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          searchWidget(updateSearchQuery),
          CategorySelector(
            categories: formatedTypes,
            selectedCategory: selectedCategory,
            onCategorySelected: updateCategory,
          ),
          FutureBuilder<List<GarageFacility>>(
              future: garagesFuture,
              builder: (BuildContext context, AsyncSnapshot<List<GarageFacility>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      showError(context, snapshot.error.toString());
                      return const Expanded(child: Center());
                    } else {
                      garages = snapshot.data!;
                      List<GarageFacility> filtered = garages.where((p) {
                        bool matchesCategory = selectedCategory == 'All' || formatType(p.type) == selectedCategory;
                        bool matchesSearch = (p.name + p.address).toLowerCase().contains(searchQuery.toLowerCase());
                        return matchesCategory && matchesSearch;
                      }).toList();
                      return GarageListWidget(garages: filtered, onGarageSelected: wrappedOnTap);
                    }
                }
              })
        ],
      ),
    );
  }
}
