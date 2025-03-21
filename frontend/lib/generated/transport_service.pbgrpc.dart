//
//  Generated code. Do not modify.
//  source: transport_service.proto
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
import 'transport_service.pb.dart' as $0;

export 'transport_service.pb.dart';

@$pb.GrpcServiceName('main.TransportService')
class TransportServiceClient extends $grpc.Client {
  static final _$createRoute = $grpc.ClientMethod<$0.Route, $0.Route>(
      '/main.TransportService/CreateRoute',
      ($0.Route value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Route.fromBuffer(value));
  static final _$alterRoute = $grpc.ClientMethod<$0.Route, $0.Route>(
      '/main.TransportService/AlterRoute',
      ($0.Route value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Route.fromBuffer(value));
  static final _$getAllRoutes = $grpc.ClientMethod<$1.Empty, $0.RouteList>(
      '/main.TransportService/GetAllRoutes',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RouteList.fromBuffer(value));
  static final _$getRouteByTransportId = $grpc.ClientMethod<$0.GetRouteByTransportIdRequest, $0.Route>(
      '/main.TransportService/GetRouteByTransportId',
      ($0.GetRouteByTransportIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Route.fromBuffer(value));
  static final _$addTransportToRoute = $grpc.ClientMethod<$0.ModifyRouteRequest, $1.Empty>(
      '/main.TransportService/AddTransportToRoute',
      ($0.ModifyRouteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$removeTransportFromRoute = $grpc.ClientMethod<$0.ModifyRouteRequest, $1.Empty>(
      '/main.TransportService/RemoveTransportFromRoute',
      ($0.ModifyRouteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getAllOperations = $grpc.ClientMethod<$1.Empty, $0.TransportOperationList>(
      '/main.TransportService/GetAllOperations',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportOperationList.fromBuffer(value));
  static final _$createOperation = $grpc.ClientMethod<$0.TransportOperation, $0.TransportOperation>(
      '/main.TransportService/CreateOperation',
      ($0.TransportOperation value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportOperation.fromBuffer(value));
  static final _$alterOperation = $grpc.ClientMethod<$0.TransportOperation, $0.TransportOperation>(
      '/main.TransportService/AlterOperation',
      ($0.TransportOperation value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportOperation.fromBuffer(value));
  static final _$getFilteredOperations = $grpc.ClientMethod<$0.OperationFilter, $0.TransportOperationList>(
      '/main.TransportService/GetFilteredOperations',
      ($0.OperationFilter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportOperationList.fromBuffer(value));
  static final _$getAllGarages = $grpc.ClientMethod<$1.Empty, $0.GarageFacilityList>(
      '/main.TransportService/GetAllGarages',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GarageFacilityList.fromBuffer(value));
  static final _$alterGarage = $grpc.ClientMethod<$0.GarageFacility, $0.GarageFacility>(
      '/main.TransportService/AlterGarage',
      ($0.GarageFacility value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GarageFacility.fromBuffer(value));
  static final _$createGarage = $grpc.ClientMethod<$0.GarageFacility, $0.GarageFacility>(
      '/main.TransportService/CreateGarage',
      ($0.GarageFacility value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GarageFacility.fromBuffer(value));
  static final _$getFilteredTransport = $grpc.ClientMethod<$0.TransportFilter, $0.TransportList>(
      '/main.TransportService/GetFilteredTransport',
      ($0.TransportFilter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportList.fromBuffer(value));
  static final _$createTransport = $grpc.ClientMethod<$0.Transport, $0.Transport>(
      '/main.TransportService/CreateTransport',
      ($0.Transport value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Transport.fromBuffer(value));
  static final _$alterTransport = $grpc.ClientMethod<$0.Transport, $0.Transport>(
      '/main.TransportService/AlterTransport',
      ($0.Transport value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Transport.fromBuffer(value));
  static final _$getAllTransports = $grpc.ClientMethod<$1.Empty, $0.TransportList>(
      '/main.TransportService/GetAllTransports',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransportList.fromBuffer(value));

  TransportServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Route> createRoute($0.Route request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoute, request, options: options);
  }

  $grpc.ResponseFuture<$0.Route> alterRoute($0.Route request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterRoute, request, options: options);
  }

  $grpc.ResponseFuture<$0.RouteList> getAllRoutes($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllRoutes, request, options: options);
  }

  $grpc.ResponseFuture<$0.Route> getRouteByTransportId($0.GetRouteByTransportIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRouteByTransportId, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> addTransportToRoute($0.ModifyRouteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTransportToRoute, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeTransportFromRoute($0.ModifyRouteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTransportFromRoute, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportOperationList> getAllOperations($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllOperations, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportOperation> createOperation($0.TransportOperation request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOperation, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportOperation> alterOperation($0.TransportOperation request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterOperation, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportOperationList> getFilteredOperations($0.OperationFilter request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredOperations, request, options: options);
  }

  $grpc.ResponseFuture<$0.GarageFacilityList> getAllGarages($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllGarages, request, options: options);
  }

  $grpc.ResponseFuture<$0.GarageFacility> alterGarage($0.GarageFacility request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterGarage, request, options: options);
  }

  $grpc.ResponseFuture<$0.GarageFacility> createGarage($0.GarageFacility request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGarage, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportList> getFilteredTransport($0.TransportFilter request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredTransport, request, options: options);
  }

  $grpc.ResponseFuture<$0.Transport> createTransport($0.Transport request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTransport, request, options: options);
  }

  $grpc.ResponseFuture<$0.Transport> alterTransport($0.Transport request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterTransport, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransportList> getAllTransports($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllTransports, request, options: options);
  }
}

@$pb.GrpcServiceName('main.TransportService')
abstract class TransportServiceBase extends $grpc.Service {
  $core.String get $name => 'main.TransportService';

  TransportServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Route, $0.Route>(
        'CreateRoute',
        createRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Route.fromBuffer(value),
        ($0.Route value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Route, $0.Route>(
        'AlterRoute',
        alterRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Route.fromBuffer(value),
        ($0.Route value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.RouteList>(
        'GetAllRoutes',
        getAllRoutes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.RouteList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRouteByTransportIdRequest, $0.Route>(
        'GetRouteByTransportId',
        getRouteByTransportId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRouteByTransportIdRequest.fromBuffer(value),
        ($0.Route value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ModifyRouteRequest, $1.Empty>(
        'AddTransportToRoute',
        addTransportToRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ModifyRouteRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ModifyRouteRequest, $1.Empty>(
        'RemoveTransportFromRoute',
        removeTransportFromRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ModifyRouteRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TransportOperationList>(
        'GetAllOperations',
        getAllOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TransportOperationList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransportOperation, $0.TransportOperation>(
        'CreateOperation',
        createOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransportOperation.fromBuffer(value),
        ($0.TransportOperation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransportOperation, $0.TransportOperation>(
        'AlterOperation',
        alterOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransportOperation.fromBuffer(value),
        ($0.TransportOperation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OperationFilter, $0.TransportOperationList>(
        'GetFilteredOperations',
        getFilteredOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OperationFilter.fromBuffer(value),
        ($0.TransportOperationList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GarageFacilityList>(
        'GetAllGarages',
        getAllGarages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GarageFacilityList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GarageFacility, $0.GarageFacility>(
        'AlterGarage',
        alterGarage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GarageFacility.fromBuffer(value),
        ($0.GarageFacility value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GarageFacility, $0.GarageFacility>(
        'CreateGarage',
        createGarage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GarageFacility.fromBuffer(value),
        ($0.GarageFacility value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransportFilter, $0.TransportList>(
        'GetFilteredTransport',
        getFilteredTransport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransportFilter.fromBuffer(value),
        ($0.TransportList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Transport, $0.Transport>(
        'CreateTransport',
        createTransport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transport.fromBuffer(value),
        ($0.Transport value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Transport, $0.Transport>(
        'AlterTransport',
        alterTransport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transport.fromBuffer(value),
        ($0.Transport value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TransportList>(
        'GetAllTransports',
        getAllTransports_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TransportList value) => value.writeToBuffer()));
  }

  $async.Future<$0.Route> createRoute_Pre($grpc.ServiceCall call, $async.Future<$0.Route> request) async {
    return createRoute(call, await request);
  }

  $async.Future<$0.Route> alterRoute_Pre($grpc.ServiceCall call, $async.Future<$0.Route> request) async {
    return alterRoute(call, await request);
  }

  $async.Future<$0.RouteList> getAllRoutes_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllRoutes(call, await request);
  }

  $async.Future<$0.Route> getRouteByTransportId_Pre($grpc.ServiceCall call, $async.Future<$0.GetRouteByTransportIdRequest> request) async {
    return getRouteByTransportId(call, await request);
  }

  $async.Future<$1.Empty> addTransportToRoute_Pre($grpc.ServiceCall call, $async.Future<$0.ModifyRouteRequest> request) async {
    return addTransportToRoute(call, await request);
  }

  $async.Future<$1.Empty> removeTransportFromRoute_Pre($grpc.ServiceCall call, $async.Future<$0.ModifyRouteRequest> request) async {
    return removeTransportFromRoute(call, await request);
  }

  $async.Future<$0.TransportOperationList> getAllOperations_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllOperations(call, await request);
  }

  $async.Future<$0.TransportOperation> createOperation_Pre($grpc.ServiceCall call, $async.Future<$0.TransportOperation> request) async {
    return createOperation(call, await request);
  }

  $async.Future<$0.TransportOperation> alterOperation_Pre($grpc.ServiceCall call, $async.Future<$0.TransportOperation> request) async {
    return alterOperation(call, await request);
  }

  $async.Future<$0.TransportOperationList> getFilteredOperations_Pre($grpc.ServiceCall call, $async.Future<$0.OperationFilter> request) async {
    return getFilteredOperations(call, await request);
  }

  $async.Future<$0.GarageFacilityList> getAllGarages_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllGarages(call, await request);
  }

  $async.Future<$0.GarageFacility> alterGarage_Pre($grpc.ServiceCall call, $async.Future<$0.GarageFacility> request) async {
    return alterGarage(call, await request);
  }

  $async.Future<$0.GarageFacility> createGarage_Pre($grpc.ServiceCall call, $async.Future<$0.GarageFacility> request) async {
    return createGarage(call, await request);
  }

  $async.Future<$0.TransportList> getFilteredTransport_Pre($grpc.ServiceCall call, $async.Future<$0.TransportFilter> request) async {
    return getFilteredTransport(call, await request);
  }

  $async.Future<$0.Transport> createTransport_Pre($grpc.ServiceCall call, $async.Future<$0.Transport> request) async {
    return createTransport(call, await request);
  }

  $async.Future<$0.Transport> alterTransport_Pre($grpc.ServiceCall call, $async.Future<$0.Transport> request) async {
    return alterTransport(call, await request);
  }

  $async.Future<$0.TransportList> getAllTransports_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllTransports(call, await request);
  }

  $async.Future<$0.Route> createRoute($grpc.ServiceCall call, $0.Route request);
  $async.Future<$0.Route> alterRoute($grpc.ServiceCall call, $0.Route request);
  $async.Future<$0.RouteList> getAllRoutes($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Route> getRouteByTransportId($grpc.ServiceCall call, $0.GetRouteByTransportIdRequest request);
  $async.Future<$1.Empty> addTransportToRoute($grpc.ServiceCall call, $0.ModifyRouteRequest request);
  $async.Future<$1.Empty> removeTransportFromRoute($grpc.ServiceCall call, $0.ModifyRouteRequest request);
  $async.Future<$0.TransportOperationList> getAllOperations($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.TransportOperation> createOperation($grpc.ServiceCall call, $0.TransportOperation request);
  $async.Future<$0.TransportOperation> alterOperation($grpc.ServiceCall call, $0.TransportOperation request);
  $async.Future<$0.TransportOperationList> getFilteredOperations($grpc.ServiceCall call, $0.OperationFilter request);
  $async.Future<$0.GarageFacilityList> getAllGarages($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.GarageFacility> alterGarage($grpc.ServiceCall call, $0.GarageFacility request);
  $async.Future<$0.GarageFacility> createGarage($grpc.ServiceCall call, $0.GarageFacility request);
  $async.Future<$0.TransportList> getFilteredTransport($grpc.ServiceCall call, $0.TransportFilter request);
  $async.Future<$0.Transport> createTransport($grpc.ServiceCall call, $0.Transport request);
  $async.Future<$0.Transport> alterTransport($grpc.ServiceCall call, $0.Transport request);
  $async.Future<$0.TransportList> getAllTransports($grpc.ServiceCall call, $1.Empty request);
}
