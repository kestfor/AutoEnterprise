import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../generated/transport_service.pb.dart' as tts;
import '../../generated/transport_service.pb.dart';
import '../../persons/data_provider/data_provider.dart' as pp;
import '../../persons/person_list.dart';
import '../../routes/route_card.dart';
import '../../transport/data_provider/data_provider.dart';
import '../../transport/transport_list.dart';
import '../../utils/notifications/notification.dart';
import '../../utils/search_filters/filters.dart';
import '../../utils/searchable_list.dart';
import '../category_button.dart';
import '../stringer.dart';

class TransportSelectorButton extends StatelessWidget {
  int? transportId;
  DataProvider transportProvider;
  Function? onSelected;
  String text;

  TransportSelectorButton(this.transportId, this.transportProvider, this.onSelected, {super.key, required this.text});

  void selectTransport(context, dataProvider, Function? onSelected) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Transport> transports = [];

    try {
      transports = await dataProvider.fetchTransports();
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    Transport? transport = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Select Transport')),
          body: SearchableList<Transport>(
              items: transports,
              listOfCardBuilder: (List<Transport> transports, Function? additional) => TransportListWidget(
                    transports: transports,
                    onTransportSelected: (transport) {
                      Navigator.pop(context, transport);
                    },
                  ),
              filterFunction: getFilteredTransports,
              categories: ["All"] + DataProvider.getTypes(),
              categoryFilterFunction: getTransportsByCategory));
    }));
    if (transport != null) {
      if (onSelected != null) {
        onSelected(transport);
      }
    }
  }

  @override
  Widget build(context) {
    return Expanded(
      child: CustomOutlinedButton(
        onPressed: () {
          selectTransport(context, transportProvider, onSelected);
        },
        onLongPress: () {
          pushDetailedRoute<Transport>(context, transportId ?? 0);
        },
        label: "transport",
        text: text,
      ),
    );
  }
}

Widget transportSelectorButton(BuildContext context, int? transportId, transportProvider, Function? onSelected,
    {Map<Type, dynamic>? detailedData}) {
  var id = transportId ?? "null";
  return Expanded(
    child: CustomOutlinedButton(
      onPressed: () {
        selectTransport(context, transportProvider, onSelected);
      },
      onLongPress: () {
        pushDetailedRoute<Transport>(context, transportId ?? 0);
      },
      label: "transport",
      text: Stringer(detailedData![Transport]).toString(),
    ),
  );
}

void selectTransport(context, dataProvider, Function? onSelected) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  var error;
  List<Transport> transports = [];

  try {
    transports = await dataProvider.fetchTransports();
  } catch (e) {
    error = e;
  }

  if (!context.mounted) return;

  Navigator.pop(context);

  if (error != null) {
    showError(context, error.toString());
    return;
  }

  Transport? transport = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Transport')),
        body: SearchableList<Transport>(
            items: transports,
            listOfCardBuilder: (List<Transport> transports, Function? additional) => TransportListWidget(
                  transports: transports,
                  onTransportSelected: (transport) {
                    Navigator.pop(context, transport);
                  },
                ),
            filterFunction: getFilteredTransports,
            categories: ["All"] + DataProvider.getTypes(),
            categoryFilterFunction: getTransportsByCategory));
  }));
  if (transport != null) {
    if (onSelected != null) {
      onSelected(transport);
    }
  }
}

Widget driverSelectorButton(BuildContext context, int? driverId, int? transportId, driverProvider, Function? onSelected,
    {Map<Type, dynamic>? detailedData}) {
  var id = driverId ?? "null";
  return Expanded(
    child: CustomOutlinedButton(
      onPressed: () {
        selectDriver(context, transportId, driverProvider, onSelected);
      },
      onLongPress: () {
        pushDetailedRoute<Person>(context, driverId ?? 0);
      },
      label: "driver",
      text: Stringer(detailedData![Person]).toString(),
    ),
  );
}

void selectDriver(
  context,
  transportId,
  dataProvider,
  Function? onSelected,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  var error;
  List<Person> persons = [];

  try {
    persons = await dataProvider.fetchPersons();
  } catch (e) {
    error = e;
  }

  if (!context.mounted) return;

  Navigator.pop(context);

  if (error != null) {
    showError(context, error.toString());
    return;
  }

  persons = persons
      .where((element) => (element.role == Role.driver.name &&
          (transportId == null ||
              element.driverInfo.hasTransportId() && element.driverInfo.transportId == transportId)))
      .toList();

  Person? person = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Person')),
        body: SearchableList<Person>(
          items: persons,
          listOfCardBuilder: (persons, additional) => PersonsListWidget(
              persons: persons,
              onSelected: (person) {
                Navigator.pop(context, person);
              }),
          filterFunction: getFilteredPersons,
        ));
  }));
  if (person != null) {
    if (onSelected != null) {
      onSelected(person);
    }
  }
}

void selectRoute(context, dataProvider, Function? onSelected) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  var error;
  List<tts.Route> routes = [];

  try {
    routes = await dataProvider.fetchRoutes();
  } catch (e) {
    error = e;
  }

  if (!context.mounted) return;

  Navigator.pop(context);

  if (error != null) {
    showError(context, error.toString());
    return;
  }

  tts.Route? route = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Route')),
        body: SearchableList<tts.Route>(
          items: routes,
          listOfCardBuilder: (persons, additional) => RouteListWidget(
              routes: persons,
              onRouteSelected: (route) {
                Navigator.pop(context, route);
              }),
          filterFunction: getFilteredRoutes,
        ));
  }));
  if (route != null) {
    if (onSelected != null) {
      onSelected(route);
    }
  }
}

Widget servicePersonnelSelectorButton(BuildContext context, int? id, dataProvider, Function? onSelected,
    {Map<Type, dynamic>? detailedData}) {
  return Expanded(
    child: CustomOutlinedButton(
      onPressed: () {
        selectServicePersonnel(context, dataProvider, onSelected);
      },
      onLongPress: () {
        pushDetailedRoute<Person>(context, id ?? 0);
      },
      label: "person",
      text: Stringer(detailedData![Person]).toString(),
    ),
  );
}

void selectServicePersonnel(
  context,
  dataProvider,
  Function? onSelected,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  var error;
  List<Person> persons = [];

  try {
    persons = await dataProvider.fetchServicePersonnel();
  } catch (e) {
    error = e;
  }

  if (!context.mounted) return;

  Navigator.pop(context);

  if (error != null) {
    showError(context, error.toString());
    return;
  }

  Person? person = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Person')),
        body: SearchableList<Person>(
          items: persons,
          listOfCardBuilder: (persons, additional) => PersonsListWidget(
              persons: persons,
              onSelected: (person) {
                Navigator.pop(context, person);
              }),
          filterFunction: getFilteredPersons,
          categories: ["All"] + pp.DataProvider.getServicePersonnelRoles(),
          categoryFilterFunction: getPersonsByCategory,
        ));
  }));
  if (person != null) {
    if (onSelected != null) {
      onSelected(person);
    }
  }
}

Widget personSelectorButton(BuildContext context, dataProvider, Function? onSelected) {
  return
    CategoryButton(
      onTap: () {
        selectPerson(context, dataProvider, onSelected);
      },
      label: "Select Person",
    );
}

void selectPerson(
  context,
  dataProvider,
  Function? onSelected,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  var error;
  List<Person> persons = [];

  try {
    persons = await dataProvider.fetchPersons();
  } catch (e) {
    error = e;
  }

  if (!context.mounted) return;

  Navigator.pop(context);

  if (error != null) {
    showError(context, error.toString());
    return;
  }

  Person? person = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Person')),
        body: SearchableList<Person>(
          items: persons,
          listOfCardBuilder: (persons, additional) => PersonsListWidget(
              persons: persons,
              onSelected: (person) {
                Navigator.pop(context, person);
              }),
          filterFunction: getFilteredPersons,
          categories: ["All"] + pp.DataProvider.getRoles(),
          categoryFilterFunction: getPersonsByCategory,
        ));
  }));
  if (person != null) {
    if (onSelected != null) {
      onSelected(person);
    }
  }
}
