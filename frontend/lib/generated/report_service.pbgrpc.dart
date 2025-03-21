//
//  Generated code. Do not modify.
//  source: report_service.proto
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

import 'google/protobuf/empty.pb.dart' as $0;
import 'report_service.pb.dart' as $1;

export 'report_service.pb.dart';

@$pb.GrpcServiceName('main.ReportService')
class ReportServiceClient extends $grpc.Client {
  static final _$getTransportByGarageDistribution = $grpc.ClientMethod<$0.Empty, $1.TransportByGarageDistributionResponse>(
      '/main.ReportService/GetTransportByGarageDistribution',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.TransportByGarageDistributionResponse.fromBuffer(value));
  static final _$getSubordination = $grpc.ClientMethod<$1.SubordinationRequest, $1.SubordinationResponse>(
      '/main.ReportService/GetSubordination',
      ($1.SubordinationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SubordinationResponse.fromBuffer(value));
  static final _$getCarMileage = $grpc.ClientMethod<$1.CarMileageRequest, $1.CarMileageResponse>(
      '/main.ReportService/GetCarMileage',
      ($1.CarMileageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CarMileageResponse.fromBuffer(value));
  static final _$getRepairCost = $grpc.ClientMethod<$1.RepairCostRequest, $1.RepairCostResponse>(
      '/main.ReportService/GetRepairCost',
      ($1.RepairCostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RepairCostResponse.fromBuffer(value));
  static final _$getDriversDistribution = $grpc.ClientMethod<$0.Empty, $1.DriversDistributionResponse>(
      '/main.ReportService/GetDriversDistribution',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DriversDistributionResponse.fromBuffer(value));
  static final _$getPassengerTransportDistribution = $grpc.ClientMethod<$0.Empty, $1.PassengerTransportDistributionResponse>(
      '/main.ReportService/GetPassengerTransportDistribution',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PassengerTransportDistributionResponse.fromBuffer(value));

  ReportServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.TransportByGarageDistributionResponse> getTransportByGarageDistribution($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransportByGarageDistribution, request, options: options);
  }

  $grpc.ResponseFuture<$1.SubordinationResponse> getSubordination($1.SubordinationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSubordination, request, options: options);
  }

  $grpc.ResponseFuture<$1.CarMileageResponse> getCarMileage($1.CarMileageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCarMileage, request, options: options);
  }

  $grpc.ResponseFuture<$1.RepairCostResponse> getRepairCost($1.RepairCostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRepairCost, request, options: options);
  }

  $grpc.ResponseFuture<$1.DriversDistributionResponse> getDriversDistribution($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDriversDistribution, request, options: options);
  }

  $grpc.ResponseFuture<$1.PassengerTransportDistributionResponse> getPassengerTransportDistribution($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPassengerTransportDistribution, request, options: options);
  }
}

@$pb.GrpcServiceName('main.ReportService')
abstract class ReportServiceBase extends $grpc.Service {
  $core.String get $name => 'main.ReportService';

  ReportServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.TransportByGarageDistributionResponse>(
        'GetTransportByGarageDistribution',
        getTransportByGarageDistribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.TransportByGarageDistributionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SubordinationRequest, $1.SubordinationResponse>(
        'GetSubordination',
        getSubordination_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SubordinationRequest.fromBuffer(value),
        ($1.SubordinationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CarMileageRequest, $1.CarMileageResponse>(
        'GetCarMileage',
        getCarMileage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CarMileageRequest.fromBuffer(value),
        ($1.CarMileageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RepairCostRequest, $1.RepairCostResponse>(
        'GetRepairCost',
        getRepairCost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RepairCostRequest.fromBuffer(value),
        ($1.RepairCostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DriversDistributionResponse>(
        'GetDriversDistribution',
        getDriversDistribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DriversDistributionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.PassengerTransportDistributionResponse>(
        'GetPassengerTransportDistribution',
        getPassengerTransportDistribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.PassengerTransportDistributionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.TransportByGarageDistributionResponse> getTransportByGarageDistribution_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTransportByGarageDistribution(call, await request);
  }

  $async.Future<$1.SubordinationResponse> getSubordination_Pre($grpc.ServiceCall call, $async.Future<$1.SubordinationRequest> request) async {
    return getSubordination(call, await request);
  }

  $async.Future<$1.CarMileageResponse> getCarMileage_Pre($grpc.ServiceCall call, $async.Future<$1.CarMileageRequest> request) async {
    return getCarMileage(call, await request);
  }

  $async.Future<$1.RepairCostResponse> getRepairCost_Pre($grpc.ServiceCall call, $async.Future<$1.RepairCostRequest> request) async {
    return getRepairCost(call, await request);
  }

  $async.Future<$1.DriversDistributionResponse> getDriversDistribution_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getDriversDistribution(call, await request);
  }

  $async.Future<$1.PassengerTransportDistributionResponse> getPassengerTransportDistribution_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getPassengerTransportDistribution(call, await request);
  }

  $async.Future<$1.TransportByGarageDistributionResponse> getTransportByGarageDistribution($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.SubordinationResponse> getSubordination($grpc.ServiceCall call, $1.SubordinationRequest request);
  $async.Future<$1.CarMileageResponse> getCarMileage($grpc.ServiceCall call, $1.CarMileageRequest request);
  $async.Future<$1.RepairCostResponse> getRepairCost($grpc.ServiceCall call, $1.RepairCostRequest request);
  $async.Future<$1.DriversDistributionResponse> getDriversDistribution($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.PassengerTransportDistributionResponse> getPassengerTransportDistribution($grpc.ServiceCall call, $0.Empty request);
}
