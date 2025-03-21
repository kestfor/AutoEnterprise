//
//  Generated code. Do not modify.
//  source: trip_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tripTypeDescriptor instead')
const TripType$json = {
  '1': 'TripType',
  '2': [
    {'1': 'cargo', '2': 0},
    {'1': 'passenger', '2': 1},
  ],
};

/// Descriptor for `TripType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tripTypeDescriptor = $convert.base64Decode(
    'CghUcmlwVHlwZRIJCgVjYXJnbxAAEg0KCXBhc3NlbmdlchAB');

@$core.Deprecated('Use tripInfoCargoDescriptor instead')
const TripInfoCargo$json = {
  '1': 'TripInfoCargo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'cargoType', '3': 2, '4': 1, '5': 9, '10': 'cargoType'},
    {'1': 'cargoName', '3': 3, '4': 1, '5': 9, '10': 'cargoName'},
    {'1': 'cargoWeight', '3': 4, '4': 1, '5': 2, '10': 'cargoWeight'},
    {'1': 'cargoCost', '3': 5, '4': 1, '5': 2, '10': 'cargoCost'},
  ],
};

/// Descriptor for `TripInfoCargo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripInfoCargoDescriptor = $convert.base64Decode(
    'Cg1UcmlwSW5mb0NhcmdvEg4KAmlkGAEgASgFUgJpZBIcCgljYXJnb1R5cGUYAiABKAlSCWNhcm'
    'dvVHlwZRIcCgljYXJnb05hbWUYAyABKAlSCWNhcmdvTmFtZRIgCgtjYXJnb1dlaWdodBgEIAEo'
    'AlILY2FyZ29XZWlnaHQSHAoJY2FyZ29Db3N0GAUgASgCUgljYXJnb0Nvc3Q=');

@$core.Deprecated('Use tripInfoPassengerDescriptor instead')
const TripInfoPassenger$json = {
  '1': 'TripInfoPassenger',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'passengersNum', '3': 2, '4': 1, '5': 5, '10': 'passengersNum'},
  ],
};

/// Descriptor for `TripInfoPassenger`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripInfoPassengerDescriptor = $convert.base64Decode(
    'ChFUcmlwSW5mb1Bhc3NlbmdlchIOCgJpZBgBIAEoBVICaWQSJAoNcGFzc2VuZ2Vyc051bRgCIA'
    'EoBVINcGFzc2VuZ2Vyc051bQ==');

@$core.Deprecated('Use tripDescriptor instead')
const Trip$json = {
  '1': 'Trip',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 1, '10': 'id', '17': true},
    {'1': 'routeId', '3': 2, '4': 1, '5': 5, '9': 2, '10': 'routeId', '17': true},
    {'1': 'driverId', '3': 3, '4': 1, '5': 5, '9': 3, '10': 'driverId', '17': true},
    {'1': 'transportId', '3': 4, '4': 1, '5': 5, '9': 4, '10': 'transportId', '17': true},
    {'1': 'startTime', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'endTime', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'endTime', '17': true},
    {'1': 'type', '3': 7, '4': 1, '5': 9, '10': 'type'},
    {'1': 'distance', '3': 10, '4': 1, '5': 2, '9': 6, '10': 'distance', '17': true},
    {'1': 'cargo', '3': 8, '4': 1, '5': 11, '6': '.main.TripInfoCargo', '9': 0, '10': 'cargo'},
    {'1': 'passengers', '3': 9, '4': 1, '5': 11, '6': '.main.TripInfoPassenger', '9': 0, '10': 'passengers'},
  ],
  '8': [
    {'1': 'tripInfo'},
    {'1': '_id'},
    {'1': '_routeId'},
    {'1': '_driverId'},
    {'1': '_transportId'},
    {'1': '_endTime'},
    {'1': '_distance'},
  ],
};

/// Descriptor for `Trip`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripDescriptor = $convert.base64Decode(
    'CgRUcmlwEhMKAmlkGAEgASgFSAFSAmlkiAEBEh0KB3JvdXRlSWQYAiABKAVIAlIHcm91dGVJZI'
    'gBARIfCghkcml2ZXJJZBgDIAEoBUgDUghkcml2ZXJJZIgBARIlCgt0cmFuc3BvcnRJZBgEIAEo'
    'BUgEUgt0cmFuc3BvcnRJZIgBARI4CglzdGFydFRpbWUYBSABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUglzdGFydFRpbWUSOQoHZW5kVGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBIBVIHZW5kVGltZYgBARISCgR0eXBlGAcgASgJUgR0eXBlEh8KCGRpc3Rhbm'
    'NlGAogASgCSAZSCGRpc3RhbmNliAEBEisKBWNhcmdvGAggASgLMhMubWFpbi5UcmlwSW5mb0Nh'
    'cmdvSABSBWNhcmdvEjkKCnBhc3NlbmdlcnMYCSABKAsyFy5tYWluLlRyaXBJbmZvUGFzc2VuZ2'
    'VySABSCnBhc3NlbmdlcnNCCgoIdHJpcEluZm9CBQoDX2lkQgoKCF9yb3V0ZUlkQgsKCV9kcml2'
    'ZXJJZEIOCgxfdHJhbnNwb3J0SWRCCgoIX2VuZFRpbWVCCwoJX2Rpc3RhbmNl');

@$core.Deprecated('Use tripFilterDescriptor instead')
const TripFilter$json = {
  '1': 'TripFilter',
  '2': [
    {'1': 'routeId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'routeId', '17': true},
    {'1': 'driverId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'driverId', '17': true},
    {'1': 'transportId', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'transportId', '17': true},
    {'1': 'dateFrom', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'dateFrom', '17': true},
    {'1': 'dateTo', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'dateTo', '17': true},
    {'1': 'type', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'type', '17': true},
    {'1': 'ids', '3': 7, '4': 3, '5': 5, '10': 'ids'},
  ],
  '8': [
    {'1': '_routeId'},
    {'1': '_driverId'},
    {'1': '_transportId'},
    {'1': '_dateFrom'},
    {'1': '_dateTo'},
    {'1': '_type'},
  ],
};

/// Descriptor for `TripFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripFilterDescriptor = $convert.base64Decode(
    'CgpUcmlwRmlsdGVyEh0KB3JvdXRlSWQYASABKAVIAFIHcm91dGVJZIgBARIfCghkcml2ZXJJZB'
    'gCIAEoBUgBUghkcml2ZXJJZIgBARIlCgt0cmFuc3BvcnRJZBgDIAEoBUgCUgt0cmFuc3BvcnRJ'
    'ZIgBARI7CghkYXRlRnJvbRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIA1IIZG'
    'F0ZUZyb22IAQESNwoGZGF0ZVRvGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgE'
    'UgZkYXRlVG+IAQESFwoEdHlwZRgGIAEoCUgFUgR0eXBliAEBEhAKA2lkcxgHIAMoBVIDaWRzQg'
    'oKCF9yb3V0ZUlkQgsKCV9kcml2ZXJJZEIOCgxfdHJhbnNwb3J0SWRCCwoJX2RhdGVGcm9tQgkK'
    'B19kYXRlVG9CBwoFX3R5cGU=');

@$core.Deprecated('Use tripListDescriptor instead')
const TripList$json = {
  '1': 'TripList',
  '2': [
    {'1': 'trips', '3': 1, '4': 3, '5': 11, '6': '.main.Trip', '10': 'trips'},
  ],
};

/// Descriptor for `TripList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripListDescriptor = $convert.base64Decode(
    'CghUcmlwTGlzdBIgCgV0cmlwcxgBIAMoCzIKLm1haW4uVHJpcFIFdHJpcHM=');

