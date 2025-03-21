import 'dart:developer';

import 'package:auto_enterprise/generated/google/protobuf/empty.pb.dart';
import 'package:auto_enterprise/generated/person_service.pbgrpc.dart';
import "package:auto_enterprise/utils/data_address.dart" as data_address;
import 'package:grpc/grpc.dart' as grpc;

class DataProvider {
  late final PersonServiceClient client;
  final port = data_address.port;
  final localhost = data_address.host;

  DataProvider() {
    final channel = grpc.ClientChannel(
      localhost,
      port: port,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );
    client = PersonServiceClient(channel);
  }

  static List<Person> getSorted(List<Person> persons) {
    return persons
      ..sort((a, b) {
        final name1 = a.firstName + a.secondName;
        final name2 = b.firstName + b.secondName;
        return name1.compareTo(name2);
      });
  }

  static List<Brigade> getSortedBrigades(List<Brigade> brigades) {
    return brigades
      ..sort((a, b) {
        return a.name.compareTo(b.name);
      });
  }

  static List<RepairWork> getSortedRepairs(List<RepairWork> repairs) {
    return repairs
      ..sort((a, b) {
        return a.id.compareTo(b.id);
      });
  }

  static List<TransportUnit> getSortedUnits(List<TransportUnit> units) {
    return units
      ..sort((a, b) {
        return a.name.compareTo(b.name);
      });
  }

  static List<String> getRoles() {
    List<String> res = [];
    for (var element in Role.values) {
      res.add(element.toString());
    }
    res.sort();
    return res;
  }

  Future<Person?> getPersonById(int id) async {
    final res = await client.getFilteredPersons(PersonFilter(ids: [id]));
    if (res.persons.isEmpty) {
      return null;
    } else {
      return res.persons[0];
    }
  }

  Future<Brigade?> getBrigadeById(int id) async {
    final res = await client.getAllBrigades(Empty());
    for (var item in res.brigades) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  Future<RepairWork?> getRepairWorkById(int id) async {
    final res = await client.getFilteredRepairWorks(RepairWorkFilter(ids: [id]));
    if (res.repairWorks.isEmpty) {
      return null;
    } else {
      return res.repairWorks[0];
    }
  }

  Future<TransportUnit?> getUnitById(int id) async {
    final res = await client.getAllTransportUnits(Empty());
    for (var item in res.units) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  Future<void> updatePerson(Person person) async {
    await client.alterPerson(person);
  }

  Future<void> createPerson(Person person) async {
    final res = await client.createPerson(person);
    person.id = res.id;
  }

  Future<void> updateRepair(RepairWork repair) async {
    await client.alterRepairWork(repair);
  }

  Future<void> createRepair(RepairWork repair) async {
    final res = await client.createRepairWork(repair);
    repair.id = res.id;
  }

  Future<void> updateBrigade(Brigade brigade) async {
    await client.alterBrigade(brigade);
  }

  Future<void> createBrigade(Brigade brigade) async {
    final res = await client.createBrigade(brigade);
    brigade.id = res.id;
  }

  Future<void> updateTransportUnit(TransportUnit unit) async {
    await client.alterTransportUnit(unit);
  }

  Future<void> createTransportUnit(TransportUnit unit) async {
    final res = await client.createTransportUnit(unit);
    unit.id = res.id;
  }

  Future<List<Person>> fetchServicePersonnel() async {
    List<Role> serviceRoles = [Role.technician, Role.plumber, Role.welder, Role.assembler];
    final data = await client.getFilteredPersons(PersonFilter(roles: serviceRoles),
        options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSorted(data.persons);
  }

  static List<String> getServicePersonnelRoles() {
    List<String> res = getRoles();
    var valuesToDelete = [Role.manager.name, Role.foreman.name, Role.master.name, Role.driver.name];
    res.removeWhere((element) => valuesToDelete.contains(element));
    return res;
  }

  Future<List<Person>> fetchDriversByTransportId(int transportId) async {
    final data = await client.getDriversByTransport(DriversRequest(transportId: transportId));
    return getSorted(data.persons);
  }

  Future<List<Brigade>> fetchBrigades() async {
    final data = await client.getAllBrigades(Empty(), options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSortedBrigades(data.brigades);
  }

  Future<List<Person>> fetchPersonByBrigade(int brigadeId) async {
    final data = await client.getFilteredPersons(
        PersonFilter(
            roles: [Role.technician, Role.plumber, Role.welder, Role.assembler, Role.driver], brigadeId: brigadeId),
        options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSorted(data.persons);
  }

  Future<List<Person>> fetchPersons() async {
    try {
      final response =
          await client.getAllPersons(Empty(), options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
      return getSorted(response.persons);
    } catch (e) {
      if (e is grpc.GrpcError && e.message != null) {
        log(e.message!);
        return Future.error(e.message!);
      }
      return Future.error("An error occurred while fetching persons");
    }
  }

  Future<List<TransportUnit>> fetchTransportUnits() async {
    final data =
        await client.getAllTransportUnits(Empty(), options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSortedUnits(data.units);
  }

  Future<List<RepairWork>> getRepairs() async {
    final data =
        await client.getAllRepairWorks(Empty(), options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSortedRepairs(data.repairWorks);
  }

  Future<List<RepairWork>> getFilteredRepairs(RepairWorkFilter filter) async {
    final data =
        await client.getFilteredRepairWorks(filter, options: grpc.CallOptions(timeout: const Duration(seconds: 3)));
    return getSortedRepairs(data.repairWorks);
  }

  static List<String> getRepairStates() {
    List<String> res = [];
    for (var it in RepairState.values) {
      res.add(it.name);
    }
    return res;
  }
}
