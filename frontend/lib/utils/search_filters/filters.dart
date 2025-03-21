import '../../generated/person_service.pb.dart';
import '../../generated/transport_service.pb.dart';
import '../../generated/transport_service.pb.dart' as tts;
import '../../generated/trip_service.pb.dart' as ts;
import '../../generated/trip_service.pb.dart';
import '../utils.dart';

List<Person> getFilteredPersons(String query, List<Person> persons) {
  if (query.isEmpty) {
    return persons;
  }
  return persons
      .where((person) =>
          person.firstName.toLowerCase().contains(query.toLowerCase()) ||
          person.secondName.toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<Person> getPersonsByCategory(String category, List<Person> persons) {
  if (category == 'All') {
    return persons;
  }
  return persons.where((person) => person.role == category).toList();
}

List<Brigade> getFilteredBrigades(String query, List<Brigade> brigades) {
  if (query.isEmpty) {
    return brigades;
  }
  return brigades.where((brigade) => brigade.name.toLowerCase().contains(query.toLowerCase())).toList();
}

List<Transport> getFilteredTransports(String query, List<Transport> transports) {
  if (query.isEmpty) {
    return transports;
  }
  return transports
      .where((transport) => ('${transport.brand}  ${transport.name}  ${transport.type} ${transport.licensePlate}')
          .toLowerCase()
          .contains(query.toLowerCase()))
      .toList();
}

List<Transport> getTransportsByCategory(String category, List<Transport> transports) {
  if (category == 'All') {
    return transports;
  }
  return transports.where((transport) => transport.type == category).toList();
}

List<GarageFacility> getFilteredGarages(String query, List<GarageFacility> garages) {
  if (query.isEmpty) {
    return garages;
  }
  return garages
      .where((garage) => ('${garage.name} ${garage.address} ${garage.id}').toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<Trip> getFilteredTrips(String query, List<Trip> trips) {
  if (query.isEmpty) {
    return trips;
  }
  return trips
      .where((trip) => ('${trip.id} ${trip.routeId} ${trip.driverId} ${trip.transportId}')
          .toLowerCase()
          .contains(query.toLowerCase()))
      .toList();
}

List<Trip> getTripsByCategory(String category, List<Trip> trips) {
  if (category == 'All') {
    return trips;
  }
  return trips.where((trip) => trip.type == category).toList();
}

List<tts.Route> getFilteredRoutes(String query, List<tts.Route> routes) {
  if (query.isEmpty) {
    return routes;
  }

  return routes
      .where((tts.Route element) => ('${element.name} ${element.id}').toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<TransportUnit> getFilteredUnits(String query, List<TransportUnit> units) {
  if (query.isEmpty) {
    return units;
  }

  return units
      .where((unit) => ('${unit.id} ${unit.name} ${unit.type}}').toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<RepairWork> getFilteredRepairs(String query, List<RepairWork> repairs) {
  if (query.isEmpty) {
    return repairs;
  }

  return repairs
      .where((repair) => ('${repair.id} ${repair.description} ${repair.transportId} ${repair.unitId} ${repair.servicePersonnelId} ${formatType(repair.state)}').toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<TransportOperation> getFilteredOperations(String query, List<TransportOperation> operations) {
  if (query.isEmpty) {
    return operations;
  }
  return operations
      .where((operation) => ('${operation.id} ${operation.description} ${operation.transportId}').toLowerCase().contains(query.toLowerCase()))
      .toList();
}

List<TransportOperation> getOperationsByCategory(String category, List<TransportOperation> operations) {
  if (category == 'All') {
    return operations;
  }
  return operations.where((operation) => formatType(operation.type) == category).toList();
}

