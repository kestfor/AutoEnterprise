import 'package:auto_enterprise/generated/transport_service.pb.dart' as transport;
import 'package:auto_enterprise/generated/trip_service.pb.dart' as trip;
import 'package:auto_enterprise/persons/brigade/brigade_editable.dart';
import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/repairs/detailed_repair.dart';
import 'package:auto_enterprise/repairs/units/detailed_unit.dart';
import 'package:auto_enterprise/routes/editable_route.dart';
import 'package:auto_enterprise/transport/data_provider/data_provider.dart' as transport_dp;
import 'package:auto_enterprise/transport/detailed/detailed_transport.dart';
import 'package:auto_enterprise/transport/garage/detailed_garage.dart';
import 'package:auto_enterprise/trips/data_provider/data_provider.dart' as trips_dp;
import 'package:auto_enterprise/trips/detailed/dynamic_form.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/person_service.pb.dart';
import '../persons/detailed/detailed_person.dart';

class DetailedDataReceiver {
  late final DataProvider personsProvider;
  late final transport_dp.DataProvider transportProvider;
  late final trips_dp.DataProvider tripsProvider;

  DetailedDataReceiver() {
    personsProvider = DataProvider();
    transportProvider = transport_dp.DataProvider();
    tripsProvider = trips_dp.DataProvider();
  }

  // Future<dynamic> receiveById<T>(int id) async {
  //   if (T == transport.Transport) {
  //     return await transportProvider.getTransportById(id);
  //   } else if (T == transport.GarageFacility) {
  //     return await transportProvider.getGarageById(id);
  //   } else if (T == transport.Route) {
  //     return await transportProvider.getRouteById(id);
  //   } else if (T == Person) {
  //     return await personsProvider.getPersonById(id);
  //   } else if (T == Brigade) {
  //     return await personsProvider.getBrigadeById(id);
  //   } else if (T == RepairWork) {
  //     return await personsProvider.getRepairWorkById(id);
  //   } else if (T == TransportUnit) {
  //     return await personsProvider.getUnitById(id);
  //   } else if (T == trip.Trip) {
  //     return await tripsProvider.getTripById(id);
  //   } else {
  //     throw Exception("not found get by id method for type $T");
  //   }
  // }

  Future<dynamic> receiveById(Type T, int id) async {
    if (T == transport.Transport) {
      return await transportProvider.getTransportById(id);
    } else if (T == transport.GarageFacility) {
      return await transportProvider.getGarageById(id);
    } else if (T == transport.Route) {
      return await transportProvider.getRouteById(id);
    } else if (T == Person) {
      return await personsProvider.getPersonById(id);
    } else if (T == Brigade) {
      return await personsProvider.getBrigadeById(id);
    } else if (T == RepairWork) {
      return await personsProvider.getRepairWorkById(id);
    } else if (T == TransportUnit) {
      return await personsProvider.getUnitById(id);
    } else if (T == trip.Trip) {
      return await tripsProvider.getTripById(id);
    } else {
      throw Exception("not found get by id method for type $T");
    }
  }

  Future<Map<Type, dynamic>> receiveMany(Map<Type, int> items) async {
    final Map<Type, dynamic> result = {};

    final List<Future<dynamic>> tasks = [];
    for (var item in items.entries) {
      Type t = item.key;
      int id = item.value;
      tasks.add(receiveById(t, id));
    }

    await Future.wait(tasks, eagerError: true).then((List<dynamic> items) {
      for (var i = 0; i < items.length; i++) {
        result[items[i].runtimeType] = items[i];
      }
    });
    return result;
  }
}

Widget _getDetailed(dynamic data) {
  Type t = data.runtimeType;
  if (t == transport.Transport) {
    return EditableTransport(transport: data);
  } else if (t == Person) {
    return EditablePerson(person: data);
  } else if (t == Brigade) {
    return EditableBrigade(brigade: data);
  } else if (t == transport.GarageFacility) {
    return EditableGarageFacility(garage: data);
  } else if (t == transport.Route) {
    return EditableRoute(route: data);
  } else if (t == RepairWork) {
    return EditableRepair(repair: data);
  } else if (t == TransportUnit) {
    return EditableUnit(unit: data);
  } else if (t == trip.Trip) {
    return DynamicTripFormScreen(trip: data);
  } else {
    throw Exception("not found editable widget for type$t");
  }
}

Future<Widget> detailed<T>(int id) async {
  final receiver = DetailedDataReceiver();
  final item = await receiver.receiveById(T, id);
  return _getDetailed(item);
}

void pushDetailedRoute<T>(BuildContext context, int id) async {
  if (id == 0) {
    return;
  }

  Widget widget = const Center();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  try {
    widget = await detailed<T>(id);
  } catch (e) {
    if (!context.mounted) {
      return;
    }
    Navigator.pop(context);
    showError(context, e.toString());
    return;
  }

  if (!context.mounted) {
    return;
  }

  Navigator.pop(context);

  Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return widget;
  }));
}
