import 'package:auto_enterprise/persons/brigade/brigade_list.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../persons/data_provider/data_provider.dart';
import '../../utils/notifications/notification.dart';
import '../utils/utils.dart';
import 'brigade_editable.dart';

class BrigadesScreen extends StatefulWidget {
  final Function? onBrigadeSelected;

  const BrigadesScreen({super.key, this.onBrigadeSelected});

  @override
  BrigadeScreenState createState() {
    return BrigadeScreenState();
  }
}

class BrigadeScreenState extends State<BrigadesScreen> {
  final dataProvider = DataProvider();
  late Future<List<Brigade>> brigadesFuture;
  List<Brigade> brigades = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  void fetchProfiles() async {
    brigadesFuture = dataProvider.fetchBrigades();
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void addBrigade() async {
    final newBrigade = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditableBrigade()),
    );
    if (newBrigade != null) {
      setState(() {
        brigades.add(newBrigade);
      });
    }
  }

  void updateScreen() {
    setState(() {});
  }

  void onSelectedWrapper(brigade) {
    if (widget.onBrigadeSelected != null) {
      widget.onBrigadeSelected!(brigade, updateScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addBrigade();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            searchWidget(updateSearchQuery),
            FutureBuilder<List<Brigade>>(
                future: brigadesFuture,
                builder: (BuildContext context, AsyncSnapshot<List<Brigade>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Expanded(child: Center(child: CircularProgressIndicator()));
                    default:
                      if (snapshot.hasError || snapshot.data == null) {
                        showError(context, snapshot.error.toString());
                        return const Expanded(child: Center());
                      } else {
                        List<Brigade> brigades = snapshot.data!;
                        this.brigades = brigades;
                        List<Brigade> filtered = brigades.where((p) {
                          bool matchesSearch = (p.name).toLowerCase().contains(searchQuery.toLowerCase());
                          return matchesSearch;
                        }).toList();
                        return BrigadesListWidget(
                            brigades: filtered,
                            onSelected: (brigade) {
                              onSelectedWrapper(brigade);
                            });
                      }
                  }
                })
          ],
        ));
  }
}
