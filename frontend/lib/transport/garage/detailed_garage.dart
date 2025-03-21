import 'package:auto_enterprise/transport//data_provider/data_provider.dart';
import 'package:auto_enterprise/transport/transport_list.dart';
import 'package:auto_enterprise/transport/transports_screen.dart';
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/transport_service.pb.dart';
import '../../persons/detailed/types/utils/utils.dart';
import '../../persons/utils/utils.dart';
import '../../utils/notifications/notification.dart';
import '../../utils/searchable_list.dart';

class EditableGarageFacility extends StatefulWidget {
  late GarageFacility garage;
  late final GarageFacility savedGarageFacility;
  final VoidCallback? onCategoryChanged;

  EditableGarageFacility({super.key, GarageFacility? garage, this.onCategoryChanged}) {
    if (garage == null) {
      this.garage = GarageFacility();
    } else {
      this.garage = garage;
    }
    savedGarageFacility = this.garage.clone();
  }

  @override
  _EditableGarageFacilityState createState() => _EditableGarageFacilityState();
}

class _EditableGarageFacilityState extends State<EditableGarageFacility> {
  List<Transport> transportToChange = [];
  final DataProvider dataProvider = DataProvider();
  final List<String> categories = DataProvider.getGarageTypes();
  late TextEditingController nameController;
  late TextEditingController addressController;
  late String category;
  late Widget additionalInfo;

  void rollbackChanges() {
    setState(() {
      widget.garage = widget.savedGarageFacility.clone();
    });
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.garage.name);
    addressController = TextEditingController(text: widget.garage.address);
    category = widget.garage.type;
  }

  void saveChanges() async {
    setState(() {
      widget.garage.name = nameController.text;
      widget.garage.address = addressController.text;
      widget.garage.type = formatType(category);
    });

    GarageFacility? newGarage;

    final saved = await saveChangesWrapper(context, () async {
      if (!widget.garage.hasId()) {
        dataProvider.createGarage(widget.garage);
        newGarage = widget.garage;
      } else {
        dataProvider.updateGarage(widget.garage);
      }

      if (transportToChange.isNotEmpty) {
        List<Future<void>> tasks = [];
        for (var transport in transportToChange) {
          transport.garageFacilityId = widget.garage.id;
          tasks.add(dataProvider.updateTransport(transport));
        }
        await Future.wait(tasks, eagerError: true);
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newGarage);
  }

  void updateCategory(String category) {
    setState(() {
      this.category = reverseFormatType(category);
    });
  }

  void viewTransports(context, DataProvider dataProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Transport> transports = [];

    try {
      if (widget.garage.hasId()) {
        transports = await dataProvider.fetchTransportsByGarageId(widget.garage.id);
      } else {
        transports = [];
      }
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return TransportSelector(
          transports: transports,
          garage: widget.garage,
          onTransportSelected: (transport) {
            transportToChange.add(transport);
          });
    }));
  }

  Widget viewTransportsButton() {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            viewTransports(context, dataProvider);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("transport",
              style: TextStyle(
                fontSize: 16,
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<String> formatedTypes = [];
    String formCurrentCategory = formatType(category);

    for (var type in categories) {
      formatedTypes.add(formatType(type));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Garage Facility')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            garageIcon(50, null),
            const SizedBox(height: 16),
            defaultTextField(nameController, "name", expanded: false),
            const SizedBox(height: 16),
            defaultTextField(addressController, "address", expanded: false),
            const SizedBox(height: 16),
            BottomCategorySelector(
              categories: formatedTypes,
              onTap: updateCategory,
              currentCategory: formCurrentCategory,
              label: Text("type"),
            ),
            const SizedBox(height: 16),
            viewTransportsButton(),
            const SizedBox(height: 24),
            saveButton(saveChanges)
          ],
        ),
      ),
    );
  }
}

class TransportSelector extends StatefulWidget {
  final List<Transport> transports;
  final GarageFacility garage;
  final Function? onTransportSelected;

  const TransportSelector({Key? key, required this.transports, this.onTransportSelected, required this.garage})
      : super(key: key);

  @override
  _TransportSelectorState createState() => _TransportSelectorState();
}

class _TransportSelectorState extends State<TransportSelector> {
  addTransport(List<Transport> oldTransports) async {
    Transport? newTransport = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Select Transport')),
              body: TransportScreen(onTransportSelected: (person, _) {
                Navigator.pop(context, person);
              })),
        ));
    if (newTransport != null) {
      if (!context.mounted) {
        return;
      }

      bool contains = () {
        for (var person in oldTransports) {
          if (person.id == newTransport.id) {
            return true;
          }
        }
        return false;
      }();
      if (contains) {
        showMessage(context, "Transport already in garage");
        return;
      } else {
        setState(() {
          newTransport.garageFacilityId = widget.garage.id;
          oldTransports.add(newTransport);
          if (widget.onTransportSelected != null) {
            widget.onTransportSelected!(newTransport);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await addTransport(widget.transports);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('Transport in garage')),
        body: SearchableList<Transport>(
          items: widget.transports,
          listOfCardBuilder: (List<Transport> transports, Function? additional) {
            return TransportListWidget(
              transports: transports,
            );
          },
          filterFunction: getFilteredTransports,
        ));
  }
}
