import 'package:auto_enterprise/generated/transport_service.pb.dart' as ts;
import 'package:auto_enterprise/generated/transport_service.pb.dart';
import 'package:auto_enterprise/persons/data_provider/data_provider.dart' as pv;
import 'package:auto_enterprise/transport/data_provider/data_provider.dart';
import 'package:auto_enterprise/transport/garage/garage_list.dart';
import 'package:auto_enterprise/trips/data_provider/data_provider.dart' as tdp;
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/wrappers/transport_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../persons/detailed/types/utils/utils.dart';
import '../../persons/person_list.dart';
import '../../persons/utils/utils.dart';
import '../../utils/notifications/notification.dart';
import '../../utils/searchable_list.dart';
import '../../utils/selectors/selectors.dart';
import '../../utils/stringer.dart';
import '../../utils/utils.dart';
import 'additional_info_mapping.dart';

class EditableTransport extends StatefulWidget {
  late Transport transport;
  late final Transport savedTransport;
  final VoidCallback? onCategoryChanged;
  final bool saveToDB;

  EditableTransport({super.key, Transport? transport, this.onCategoryChanged, this.saveToDB = true}) {
    if (transport == null) {
      this.transport = Transport(type: "bus")..busInfo = BusInfo();
    } else {
      this.transport = transport;
    }
    savedTransport = this.transport.clone();
    print(saveToDB);
  }

  @override
  _EditableTransportState createState() => _EditableTransportState();
}

class _EditableTransportState extends State<EditableTransport> {
  final DataProvider dataProvider = DataProvider();
  final pv.DataProvider personDataProvider = pv.DataProvider();
  final tdp.DataProvider tripsData = tdp.DataProvider();

  ts.Route? route = null;
  bool newRoute = false;
  final List<String> categories = DataProvider.getTypes();
  late TextEditingController brandController;
  late TextEditingController nameController;
  late TextEditingController licencePlateController;
  late String category;
  late Widget additionalInfo;

  Map<Type, dynamic> detailedData = {};

  void rollbackChanges() {
    setState(() {
      widget.transport = widget.savedTransport.clone();
    });
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.transport.name);
    licencePlateController = TextEditingController(text: widget.transport.licensePlate);
    brandController = TextEditingController(text: widget.transport.brand);
    additionalInfo = additionalInfoWidget(widget.transport, saveChanges);

    category = widget.transport.type;

    DetailedDataReceiver receiver = DetailedDataReceiver();

    dataProvider.getRouteByTransportId(widget.transport.id).then((value) {
      route = value;
      Map<Type, int> itemsToReceive = {
        GarageFacility: widget.transport.garageFacilityId,
        ts.Route: route == null ? 0 : route!.id
      };
      receiver.receiveMany(itemsToReceive).then((value) {
        setState(() {
          detailedData = value;
        });
      });
    });
  }

  Widget routeButton() {
    return SizedBox(
        width: double.infinity,
        child: CustomOutlinedButton(
            label: "route",
            onPressed: () {
              selectRoute(context, dataProvider, (ts.Route getted) {
                setState(() {
                  if (route == null || route!.id != getted.id) {
                    newRoute = true;
                  }
                  route ??= getted;
                  route!.id = getted.id;
                  detailedData[ts.Route] = getted;
                });
              });
            },
            text: Stringer(detailedData[ts.Route]).toString()));
  }

  void saveChanges() async {
    setState(() {
      widget.transport.name = nameController.text;
      widget.transport.licensePlate = licencePlateController.text;
      widget.transport.type = category;
    });

    if (!widget.saveToDB) {
      Navigator.pop(context, widget.transport);
      return;
    }

    Transport? newTransport;
    bool saved = await saveChangesWrapper(context, () async {
      if (widget.transport.hasId()) {
        await dataProvider.updateTransport(widget.transport);
      } else {
        await dataProvider.createTransport(widget.transport);
        newTransport = widget.transport;
      }
      if (newRoute) {
        await dataProvider.addTransportsToRoute([widget.transport.id], route!.id);
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newTransport);
  }

  void updateCategory(String category) {
    setState(() {
      TransportType? type = TransportWrapper.typeFromString(category);
      TransportWrapper(widget.transport).setType(type!);
      this.category = category;
      additionalInfo = additionalInfoWidget(widget.transport, saveChanges);
    });
  }

  void selectGarageFacility(context, DataProvider dataProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<GarageFacility> persons = [];

    try {
      persons = await dataProvider.fetchGarages();
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    Widget getGarageFacilitiesCardFunction(List<GarageFacility> persons, Function? additional) {
      return GarageListWidget(
        garages: persons,
        onGarageSelected: (person) {
          Navigator.pop(context, person);
        },
      );
    }

    GarageFacility? garage = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Select Garage')),
          body: SearchableList<GarageFacility>(
            items: persons,
            listOfCardBuilder: getGarageFacilitiesCardFunction,
            filterFunction: getFilteredGarages,
          ));
    }));
    if (garage != null) {
      setState(() {
        detailedData[GarageFacility] = garage;
        widget.transport.garageFacilityId = garage.id;
      });
    }
  }

  Widget routeSelectorButton(BuildContext context, int? routeId, dataProvider, Function? onSelected) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          selectRoute(context, dataProvider, onSelected);
        },
        onLongPress: () {
          int id = routeId ?? 0;
          pushDetailedRoute<ts.Route>(context, id);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(Stringer(detailedData[ts.Route]).toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black54)),
      ),
    );
  }

  Widget garageSelectorButton() {
    var id = widget.transport.hasGarageFacilityId() ? widget.transport.garageFacilityId.toString() : "null";
    return SizedBox(
        width: double.infinity,
        child: CustomOutlinedButton(
          onPressed: () {
            selectGarageFacility(context, dataProvider);
          },
          onLongPress: () {
            pushDetailedRoute<GarageFacility>(context, widget.transport.garageFacilityId);
          },
          label: "garage",
          text: Stringer(detailedData[GarageFacility]).toString(),
        ));
  }

  void viewPeople(context, DataProvider dataProvide) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Person> persons = [];

    if (!widget.transport.hasId()) {
      Navigator.pop(context);
      return;
    }

    try {
      persons = await personDataProvider.fetchDriversByTransportId(widget.transport.id);
      print(persons);
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
      return Scaffold(
          appBar: AppBar(title: Text('Drivers (${persons.length})')),
          body: SearchableList<Person>(
            items: persons,
            listOfCardBuilder: (List<Person> persons, Function? additional) {
              return PersonsListWidget(
                persons: persons,
              );
            },
            filterFunction: getFilteredPersons,
          ));
    }));
  }

  Widget viewPeopleButton() {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            viewPeople(context, dataProvider);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Drivers",
              style: TextStyle(
                fontSize: 16,
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Transport')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            transportIcon(50, null),
            const SizedBox(height: 16),
            Row(
              children: [
                defaultTextField(nameController, "name"),
                const SizedBox(width: 16),
                defaultTextField(licencePlateController, "licence plate"),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(child: defaultTextField(brandController, "brand", expanded: false)),
            const SizedBox(height: 16),
            garageSelectorButton(),
            const SizedBox(height: 16),
            routeButton(),
            const SizedBox(height: 16),
            BottomCategorySelector(categories: categories, onTap: updateCategory, currentCategory: category),
            const SizedBox(height: 16),
            viewPeopleButton(),
            const SizedBox(height: 16),
            additionalInfo
          ],
        ),
      )),
    );
  }
}
