//
//  Generated code. Do not modify.
//  source: person_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $1;
import 'person_service.pb.dart' as $0;

export 'person_service.pb.dart';

@$pb.GrpcServiceName('main.PersonService')
class PersonServiceClient extends $grpc.Client {
  static final _$createTransportUnit = $grpc.ClientMethod<$0.TransportUnit, $0.TransportUnit>(
      '/main.PersonService/CreateTransportUnit',
      ($0.TransportUnit value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportUnit.fromBuffer(value));
  static final _$alterTransportUnit = $grpc.ClientMethod<$0.TransportUnit, $0.TransportUnit>(
      '/main.PersonService/AlterTransportUnit',
      ($0.TransportUnit value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportUnit.fromBuffer(value));
  static final _$getAllTransportUnits = $grpc.ClientMethod<$1.Empty, $0.TransportUnitList>(
      '/main.PersonService/GetAllTransportUnits',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportUnitList.fromBuffer(value));
  static final _$getFilteredPersons = $grpc.ClientMethod<$0.PersonFilter, $0.PersonList>(
      '/main.PersonService/GetFilteredPersons',
      ($0.PersonFilter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PersonList.fromBuffer(value));
  static final _$getFilteredRepairWorks = $grpc.ClientMethod<$0.RepairWorkFilter, $0.RepairWorkList>(
      '/main.PersonService/GetFilteredRepairWorks',
      ($0.RepairWorkFilter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RepairWorkList.fromBuffer(value));
  static final _$getDriversByTransport = $grpc.ClientMethod<$0.DriversRequest, $0.PersonList>(
      '/main.PersonService/GetDriversByTransport',
      ($0.DriversRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PersonList.fromBuffer(value));
  static final _$alterRepairWork = $grpc.ClientMethod<$0.RepairWork, $0.RepairWork>(
      '/main.PersonService/AlterRepairWork',
      ($0.RepairWork value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RepairWork.fromBuffer(value));
  static final _$createRepairWork = $grpc.ClientMethod<$0.RepairWork, $0.RepairWork>(
      '/main.PersonService/CreateRepairWork',
      ($0.RepairWork value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RepairWork.fromBuffer(value));
  static final _$getAllRepairWorks = $grpc.ClientMethod<$1.Empty, $0.RepairWorkList>(
      '/main.PersonService/GetAllRepairWorks',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RepairWorkList.fromBuffer(value));
  static final _$createBrigade = $grpc.ClientMethod<$0.Brigade, $0.Brigade>(
      '/main.PersonService/CreateBrigade',
      ($0.Brigade value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Brigade.fromBuffer(value));
  static final _$alterBrigade = $grpc.ClientMethod<$0.Brigade, $0.Brigade>(
      '/main.PersonService/AlterBrigade',
      ($0.Brigade value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Brigade.fromBuffer(value));
  static final _$getAllBrigades = $grpc.ClientMethod<$1.Empty, $0.BrigadeList>(
      '/main.PersonService/GetAllBrigades',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BrigadeList.fromBuffer(value));
  static final _$createPerson = $grpc.ClientMethod<$0.Person, $0.Person>(
      '/main.PersonService/CreatePerson',
      ($0.Person value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Person.fromBuffer(value));
  static final _$alterPerson = $grpc.ClientMethod<$0.Person, $0.Person>(
      '/main.PersonService/AlterPerson',
      ($0.Person value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Person.fromBuffer(value));
  static final _$getAllPersons = $grpc.ClientMethod<$1.Empty, $0.PersonList>(
      '/main.PersonService/GetAllPersons',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PersonList.fromBuffer(value));

  PersonServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.TransportUnit> createTransportUnit($0.TransportUnit request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTransportUnit, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportUnit> alterTransportUnit($0.TransportUnit request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterTransportUnit, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportUnitList> getAllTransportUnits($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllTransportUnits, request, options: options);
  }

  $grpc.ResponseFuture<$0.PersonList> getFilteredPersons($0.PersonFilter request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredPersons, request, options: options);
  }

  $grpc.ResponseFuture<$0.RepairWorkList> getFilteredRepairWorks($0.RepairWorkFilter request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredRepairWorks, request, options: options);
  }

  $grpc.ResponseFuture<$0.PersonList> getDriversByTransport($0.DriversRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDriversByTransport, request, options: options);
  }

  $grpc.ResponseFuture<$0.RepairWork> alterRepairWork($0.RepairWork request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterRepairWork, request, options: options);
  }

  $grpc.ResponseFuture<$0.RepairWork> createRepairWork($0.RepairWork request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRepairWork, request, options: options);
  }

  $grpc.ResponseFuture<$0.RepairWorkList> getAllRepairWorks($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllRepairWorks, request, options: options);
  }

  $grpc.ResponseFuture<$0.Brigade> createBrigade($0.Brigade request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBrigade, request, options: options);
  }

  $grpc.ResponseFuture<$0.Brigade> alterBrigade($0.Brigade request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterBrigade, request, options: options);
  }

  $grpc.ResponseFuture<$0.BrigadeList> getAllBrigades($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllBrigades, request, options: options);
  }

  $grpc.ResponseFuture<$0.Person> createPerson($0.Person request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPerson, request, options: options);
  }

  $grpc.ResponseFuture<$0.Person> alterPerson($0.Person request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterPerson, request, options: options);
  }

  $grpc.ResponseFuture<$0.PersonList> getAllPersons($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllPersons, request, options: options);
  }
}

@$pb.GrpcServiceName('main.PersonService')
abstract class PersonServiceBase extends $grpc.Service {
  $core.String get $name => 'main.PersonService';

  PersonServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TransportUnit, $0.TransportUnit>(
        'CreateTransportUnit',
        createTransportUnit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransportUnit.fromBuffer(value),
        ($0.TransportUnit value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransportUnit, $0.TransportUnit>(
        'AlterTransportUnit',
        alterTransportUnit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransportUnit.fromBuffer(value),
        ($0.TransportUnit value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TransportUnitList>(
        'GetAllTransportUnits',
        getAllTransportUnits_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TransportUnitList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PersonFilter, $0.PersonList>(
        'GetFilteredPersons',
        getFilteredPersons_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PersonFilter.fromBuffer(value),
        ($0.PersonList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RepairWorkFilter, $0.RepairWorkList>(
        'GetFilteredRepairWorks',
        getFilteredRepairWorks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RepairWorkFilter.fromBuffer(value),
        ($0.RepairWorkList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DriversRequest, $0.PersonList>(
        'GetDriversByTransport',
        getDriversByTransport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DriversRequest.fromBuffer(value),
        ($0.PersonList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RepairWork, $0.RepairWork>(
        'AlterRepairWork',
        alterRepairWork_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RepairWork.fromBuffer(value),
        ($0.RepairWork value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RepairWork, $0.RepairWork>(
        'CreateRepairWork',
        createRepairWork_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RepairWork.fromBuffer(value),
        ($0.RepairWork value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.RepairWorkList>(
        'GetAllRepairWorks',
        getAllRepairWorks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.RepairWorkList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Brigade, $0.Brigade>(
        'CreateBrigade',
        createBrigade_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Brigade.fromBuffer(value),
        ($0.Brigade value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Brigade, $0.Brigade>(
        'AlterBrigade',
        alterBrigade_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Brigade.fromBuffer(value),
        ($0.Brigade value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.BrigadeList>(
        'GetAllBrigades',
        getAllBrigades_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.BrigadeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Person, $0.Person>(
        'CreatePerson',
        createPerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Person.fromBuffer(value),
        ($0.Person value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Person, $0.Person>(
        'AlterPerson',
        alterPerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Person.fromBuffer(value),
        ($0.Person value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.PersonList>(
        'GetAllPersons',
        getAllPersons_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.PersonList value) => value.writeToBuffer()));
  }

  $async.Future<$0.TransportUnit> createTransportUnit_Pre($grpc.ServiceCall call, $async.Future<$0.TransportUnit> request) async {
    return createTransportUnit(call, await request);
  }

  $async.Future<$0.TransportUnit> alterTransportUnit_Pre($grpc.ServiceCall call, $async.Future<$0.TransportUnit> request) async {
    return alterTransportUnit(call, await request);
  }

  $async.Future<$0.TransportUnitList> getAllTransportUnits_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllTransportUnits(call, await request);
  }

  $async.Future<$0.PersonList> getFilteredPersons_Pre($grpc.ServiceCall call, $async.Future<$0.PersonFilter> request) async {
    return getFilteredPersons(call, await request);
  }

  $async.Future<$0.RepairWorkList> getFilteredRepairWorks_Pre($grpc.ServiceCall call, $async.Future<$0.RepairWorkFilter> request) async {
    return getFilteredRepairWorks(call, await request);
  }

  $async.Future<$0.PersonList> getDriversByTransport_Pre($grpc.ServiceCall call, $async.Future<$0.DriversRequest> request) async {
    return getDriversByTransport(call, await request);
  }

  $async.Future<$0.RepairWork> alterRepairWork_Pre($grpc.ServiceCall call, $async.Future<$0.RepairWork> request) async {
    return alterRepairWork(call, await request);
  }

  $async.Future<$0.RepairWork> createRepairWork_Pre($grpc.ServiceCall call, $async.Future<$0.RepairWork> request) async {
    return createRepairWork(call, await request);
  }

  $async.Future<$0.RepairWorkList> getAllRepairWorks_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllRepairWorks(call, await request);
  }

  $async.Future<$0.Brigade> createBrigade_Pre($grpc.ServiceCall call, $async.Future<$0.Brigade> request) async {
    return createBrigade(call, await request);
  }

  $async.Future<$0.Brigade> alterBrigade_Pre($grpc.ServiceCall call, $async.Future<$0.Brigade> request) async {
    return alterBrigade(call, await request);
  }

  $async.Future<$0.BrigadeList> getAllBrigades_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllBrigades(call, await request);
  }

  $async.Future<$0.Person> createPerson_Pre($grpc.ServiceCall call, $async.Future<$0.Person> request) async {
    return createPerson(call, await request);
  }

  $async.Future<$0.Person> alterPerson_Pre($grpc.ServiceCall call, $async.Future<$0.Person> request) async {
    return alterPerson(call, await request);
  }

  $async.Future<$0.PersonList> getAllPersons_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllPersons(call, await request);
  }

  $async.Future<$0.TransportUnit> createTransportUnit($grpc.ServiceCall call, $0.TransportUnit request);
  $async.Future<$0.TransportUnit> alterTransportUnit($grpc.ServiceCall call, $0.TransportUnit request);
  $async.Future<$0.TransportUnitList> getAllTransportUnits($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.PersonList> getFilteredPersons($grpc.ServiceCall call, $0.PersonFilter request);
  $async.Future<$0.RepairWorkList> getFilteredRepairWorks($grpc.ServiceCall call, $0.RepairWorkFilter request);
  $async.Future<$0.PersonList> getDriversByTransport($grpc.ServiceCall call, $0.DriversRequest request);
  $async.Future<$0.RepairWork> alterRepairWork($grpc.ServiceCall call, $0.RepairWork request);
  $async.Future<$0.RepairWork> createRepairWork($grpc.ServiceCall call, $0.RepairWork request);
  $async.Future<$0.RepairWorkList> getAllRepairWorks($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Brigade> createBrigade($grpc.ServiceCall call, $0.Brigade request);
  $async.Future<$0.Brigade> alterBrigade($grpc.ServiceCall call, $0.Brigade request);
  $async.Future<$0.BrigadeList> getAllBrigades($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Person> createPerson($grpc.ServiceCall call, $0.Person request);
  $async.Future<$0.Person> alterPerson($grpc.ServiceCall call, $0.Person request);
  $async.Future<$0.PersonList> getAllPersons($grpc.ServiceCall call, $1.Empty request);
}
