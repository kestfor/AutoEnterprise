//
//  Generated code. Do not modify.
//  source: trip_service.proto
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
import 'trip_service.pb.dart' as $0;

export 'trip_service.pb.dart';

@$pb.GrpcServiceName('main.TripsService')
class TripsServiceClient extends $grpc.Client {
  static final _$createTrip = $grpc.ClientMethod<$0.Trip, $0.Trip>(
      '/main.TripsService/CreateTrip',
      ($0.Trip value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Trip.fromBuffer(value));
  static final _$getAllTrips = $grpc.ClientMethod<$1.Empty, $0.TripList>(
      '/main.TripsService/GetAllTrips',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TripList.fromBuffer(value));
  static final _$alterTrip = $grpc.ClientMethod<$0.Trip, $0.Trip>(
      '/main.TripsService/AlterTrip',
      ($0.Trip value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Trip.fromBuffer(value));
  static final _$getFilteredTrips = $grpc.ClientMethod<$0.TripFilter, $0.TripList>(
      '/main.TripsService/GetFilteredTrips',
      ($0.TripFilter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TripList.fromBuffer(value));

  TripsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Trip> createTrip($0.Trip request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTrip, request, options: options);
  }

  $grpc.ResponseFuture<$0.TripList> getAllTrips($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllTrips, request, options: options);
  }

  $grpc.ResponseFuture<$0.Trip> alterTrip($0.Trip request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$alterTrip, request, options: options);
  }

  $grpc.ResponseFuture<$0.TripList> getFilteredTrips($0.TripFilter request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredTrips, request, options: options);
  }
}

@$pb.GrpcServiceName('main.TripsService')
abstract class TripsServiceBase extends $grpc.Service {
  $core.String get $name => 'main.TripsService';

  TripsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Trip, $0.Trip>(
        'CreateTrip',
        createTrip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Trip.fromBuffer(value),
        ($0.Trip value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TripList>(
        'GetAllTrips',
        getAllTrips_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TripList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Trip, $0.Trip>(
        'AlterTrip',
        alterTrip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Trip.fromBuffer(value),
        ($0.Trip value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TripFilter, $0.TripList>(
        'GetFilteredTrips',
        getFilteredTrips_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TripFilter.fromBuffer(value),
        ($0.TripList value) => value.writeToBuffer()));
  }

  $async.Future<$0.Trip> createTrip_Pre($grpc.ServiceCall call, $async.Future<$0.Trip> request) async {
    return createTrip(call, await request);
  }

  $async.Future<$0.TripList> getAllTrips_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllTrips(call, await request);
  }

  $async.Future<$0.Trip> alterTrip_Pre($grpc.ServiceCall call, $async.Future<$0.Trip> request) async {
    return alterTrip(call, await request);
  }

  $async.Future<$0.TripList> getFilteredTrips_Pre($grpc.ServiceCall call, $async.Future<$0.TripFilter> request) async {
    return getFilteredTrips(call, await request);
  }

  $async.Future<$0.Trip> createTrip($grpc.ServiceCall call, $0.Trip request);
  $async.Future<$0.TripList> getAllTrips($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Trip> alterTrip($grpc.ServiceCall call, $0.Trip request);
  $async.Future<$0.TripList> getFilteredTrips($grpc.ServiceCall call, $0.TripFilter request);
}
