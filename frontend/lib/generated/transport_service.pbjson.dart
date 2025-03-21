//
//  Generated code. Do not modify.
//  source: transport_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transportTypeDescriptor instead')
const TransportType$json = {
  '1': 'TransportType',
  '2': [
    {'1': 'bus', '2': 0},
    {'1': 'taxi', '2': 1},
    {'1': 'tram', '2': 2},
    {'1': 'trolleybus', '2': 3},
    {'1': 'truck', '2': 4},
  ],
};

/// Descriptor for `TransportType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transportTypeDescriptor = $convert.base64Decode(
    'Cg1UcmFuc3BvcnRUeXBlEgcKA2J1cxAAEggKBHRheGkQARIICgR0cmFtEAISDgoKdHJvbGxleW'
    'J1cxADEgkKBXRydWNrEAQ=');

@$core.Deprecated('Use garageFacilityTypeDescriptor instead')
const GarageFacilityType$json = {
  '1': 'GarageFacilityType',
  '2': [
    {'1': 'attached_garage', '2': 0},
    {'1': 'detached_garage', '2': 1},
    {'1': 'carport', '2': 2},
  ],
};

/// Descriptor for `GarageFacilityType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List garageFacilityTypeDescriptor = $convert.base64Decode(
    'ChJHYXJhZ2VGYWNpbGl0eVR5cGUSEwoPYXR0YWNoZWRfZ2FyYWdlEAASEwoPZGV0YWNoZWRfZ2'
    'FyYWdlEAESCwoHY2FycG9ydBAC');

@$core.Deprecated('Use transportOperationTypeDescriptor instead')
const TransportOperationType$json = {
  '1': 'TransportOperationType',
  '2': [
    {'1': 'purchase', '2': 0},
    {'1': 'write_off', '2': 1},
    {'1': 'sale', '2': 2},
  ],
};

/// Descriptor for `TransportOperationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transportOperationTypeDescriptor = $convert.base64Decode(
    'ChZUcmFuc3BvcnRPcGVyYXRpb25UeXBlEgwKCHB1cmNoYXNlEAASDQoJd3JpdGVfb2ZmEAESCA'
    'oEc2FsZRAC');

@$core.Deprecated('Use transportOperationDescriptor instead')
const TransportOperation$json = {
  '1': 'TransportOperation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'date', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'transportId', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'transportId', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_description'},
    {'1': '_transportId'},
  ],
};

/// Descriptor for `TransportOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportOperationDescriptor = $convert.base64Decode(
    'ChJUcmFuc3BvcnRPcGVyYXRpb24SEwoCaWQYASABKAVIAFICaWSIAQESEgoEdHlwZRgCIAEoCV'
    'IEdHlwZRIuCgRkYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZGF0ZRIl'
    'CgtkZXNjcmlwdGlvbhgEIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgt0cmFuc3BvcnRJZBgFIA'
    'EoBUgCUgt0cmFuc3BvcnRJZIgBAUIFCgNfaWRCDgoMX2Rlc2NyaXB0aW9uQg4KDF90cmFuc3Bv'
    'cnRJZA==');

@$core.Deprecated('Use garageFacilityDescriptor instead')
const GarageFacility$json = {
  '1': 'GarageFacility',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
  ],
  '8': [
    {'1': '_id'},
  ],
};

/// Descriptor for `GarageFacility`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List garageFacilityDescriptor = $convert.base64Decode(
    'Cg5HYXJhZ2VGYWNpbGl0eRITCgJpZBgBIAEoBUgAUgJpZIgBARISCgR0eXBlGAIgASgJUgR0eX'
    'BlEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzc0IFCgNfaWQ=');

@$core.Deprecated('Use busInfoDescriptor instead')
const BusInfo$json = {
  '1': 'BusInfo',
  '2': [
    {'1': 'passengersNum', '3': 2, '4': 1, '5': 5, '10': 'passengersNum'},
  ],
};

/// Descriptor for `BusInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busInfoDescriptor = $convert.base64Decode(
    'CgdCdXNJbmZvEiQKDXBhc3NlbmdlcnNOdW0YAiABKAVSDXBhc3NlbmdlcnNOdW0=');

@$core.Deprecated('Use taxiInfoDescriptor instead')
const TaxiInfo$json = {
  '1': 'TaxiInfo',
  '2': [
    {'1': 'isAvailable', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
    {'1': 'yearsOfManufacture', '3': 2, '4': 1, '5': 5, '10': 'yearsOfManufacture'},
    {'1': 'fuelType', '3': 3, '4': 1, '5': 9, '10': 'fuelType'},
  ],
};

/// Descriptor for `TaxiInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taxiInfoDescriptor = $convert.base64Decode(
    'CghUYXhpSW5mbxIgCgtpc0F2YWlsYWJsZRgBIAEoCFILaXNBdmFpbGFibGUSLgoSeWVhcnNPZk'
    '1hbnVmYWN0dXJlGAIgASgFUhJ5ZWFyc09mTWFudWZhY3R1cmUSGgoIZnVlbFR5cGUYAyABKAlS'
    'CGZ1ZWxUeXBl');

@$core.Deprecated('Use tramInfoDescriptor instead')
const TramInfo$json = {
  '1': 'TramInfo',
  '2': [
    {'1': 'passengersNum', '3': 2, '4': 1, '5': 5, '10': 'passengersNum'},
    {'1': 'yearsOfManufacture', '3': 3, '4': 1, '5': 5, '10': 'yearsOfManufacture'},
    {'1': 'isOperational', '3': 4, '4': 1, '5': 8, '10': 'isOperational'},
  ],
};

/// Descriptor for `TramInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tramInfoDescriptor = $convert.base64Decode(
    'CghUcmFtSW5mbxIkCg1wYXNzZW5nZXJzTnVtGAIgASgFUg1wYXNzZW5nZXJzTnVtEi4KEnllYX'
    'JzT2ZNYW51ZmFjdHVyZRgDIAEoBVISeWVhcnNPZk1hbnVmYWN0dXJlEiQKDWlzT3BlcmF0aW9u'
    'YWwYBCABKAhSDWlzT3BlcmF0aW9uYWw=');

@$core.Deprecated('Use trolleybusInfoDescriptor instead')
const TrolleybusInfo$json = {
  '1': 'TrolleybusInfo',
  '2': [
    {'1': 'passengersNum', '3': 2, '4': 1, '5': 5, '10': 'passengersNum'},
    {'1': 'yearsOfManufacture', '3': 3, '4': 1, '5': 5, '10': 'yearsOfManufacture'},
    {'1': 'isOperational', '3': 4, '4': 1, '5': 8, '10': 'isOperational'},
  ],
};

/// Descriptor for `TrolleybusInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trolleybusInfoDescriptor = $convert.base64Decode(
    'Cg5Ucm9sbGV5YnVzSW5mbxIkCg1wYXNzZW5nZXJzTnVtGAIgASgFUg1wYXNzZW5nZXJzTnVtEi'
    '4KEnllYXJzT2ZNYW51ZmFjdHVyZRgDIAEoBVISeWVhcnNPZk1hbnVmYWN0dXJlEiQKDWlzT3Bl'
    'cmF0aW9uYWwYBCABKAhSDWlzT3BlcmF0aW9uYWw=');

@$core.Deprecated('Use truckInfoDescriptor instead')
const TruckInfo$json = {
  '1': 'TruckInfo',
  '2': [
    {'1': 'cargoCapacityKg', '3': 2, '4': 1, '5': 2, '10': 'cargoCapacityKg'},
    {'1': 'fuelConsumption', '3': 3, '4': 1, '5': 2, '10': 'fuelConsumption'},
    {'1': 'truckType', '3': 4, '4': 1, '5': 9, '10': 'truckType'},
    {'1': 'yearsOfManufacture', '3': 5, '4': 1, '5': 5, '10': 'yearsOfManufacture'},
  ],
};

/// Descriptor for `TruckInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List truckInfoDescriptor = $convert.base64Decode(
    'CglUcnVja0luZm8SKAoPY2FyZ29DYXBhY2l0eUtnGAIgASgCUg9jYXJnb0NhcGFjaXR5S2cSKA'
    'oPZnVlbENvbnN1bXB0aW9uGAMgASgCUg9mdWVsQ29uc3VtcHRpb24SHAoJdHJ1Y2tUeXBlGAQg'
    'ASgJUgl0cnVja1R5cGUSLgoSeWVhcnNPZk1hbnVmYWN0dXJlGAUgASgFUhJ5ZWFyc09mTWFudW'
    'ZhY3R1cmU=');

@$core.Deprecated('Use transportDescriptor instead')
const Transport$json = {
  '1': 'Transport',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 1, '10': 'id', '17': true},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'brand', '3': 3, '4': 1, '5': 9, '10': 'brand'},
    {'1': 'garageFacilityId', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'garageFacilityId', '17': true},
    {'1': 'licensePlate', '3': 5, '4': 1, '5': 9, '10': 'licensePlate'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'busInfo', '3': 10, '4': 1, '5': 11, '6': '.main.BusInfo', '9': 0, '10': 'busInfo'},
    {'1': 'taxiInfo', '3': 11, '4': 1, '5': 11, '6': '.main.TaxiInfo', '9': 0, '10': 'taxiInfo'},
    {'1': 'tramInfo', '3': 7, '4': 1, '5': 11, '6': '.main.TramInfo', '9': 0, '10': 'tramInfo'},
    {'1': 'trolleybusInfo', '3': 8, '4': 1, '5': 11, '6': '.main.TrolleybusInfo', '9': 0, '10': 'trolleybusInfo'},
    {'1': 'truckInfo', '3': 9, '4': 1, '5': 11, '6': '.main.TruckInfo', '9': 0, '10': 'truckInfo'},
  ],
  '8': [
    {'1': 'transportInfo'},
    {'1': '_id'},
    {'1': '_garageFacilityId'},
  ],
};

/// Descriptor for `Transport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportDescriptor = $convert.base64Decode(
    'CglUcmFuc3BvcnQSEwoCaWQYASABKAVIAVICaWSIAQESEgoEdHlwZRgCIAEoCVIEdHlwZRIUCg'
    'VicmFuZBgDIAEoCVIFYnJhbmQSLwoQZ2FyYWdlRmFjaWxpdHlJZBgEIAEoBUgCUhBnYXJhZ2VG'
    'YWNpbGl0eUlkiAEBEiIKDGxpY2Vuc2VQbGF0ZRgFIAEoCVIMbGljZW5zZVBsYXRlEhIKBG5hbW'
    'UYBiABKAlSBG5hbWUSKQoHYnVzSW5mbxgKIAEoCzINLm1haW4uQnVzSW5mb0gAUgdidXNJbmZv'
    'EiwKCHRheGlJbmZvGAsgASgLMg4ubWFpbi5UYXhpSW5mb0gAUgh0YXhpSW5mbxIsCgh0cmFtSW'
    '5mbxgHIAEoCzIOLm1haW4uVHJhbUluZm9IAFIIdHJhbUluZm8SPgoOdHJvbGxleWJ1c0luZm8Y'
    'CCABKAsyFC5tYWluLlRyb2xsZXlidXNJbmZvSABSDnRyb2xsZXlidXNJbmZvEi8KCXRydWNrSW'
    '5mbxgJIAEoCzIPLm1haW4uVHJ1Y2tJbmZvSABSCXRydWNrSW5mb0IPCg10cmFuc3BvcnRJbmZv'
    'QgUKA19pZEITChFfZ2FyYWdlRmFjaWxpdHlJZA==');

@$core.Deprecated('Use transportListDescriptor instead')
const TransportList$json = {
  '1': 'TransportList',
  '2': [
    {'1': 'transports', '3': 1, '4': 3, '5': 11, '6': '.main.Transport', '10': 'transports'},
  ],
};

/// Descriptor for `TransportList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportListDescriptor = $convert.base64Decode(
    'Cg1UcmFuc3BvcnRMaXN0Ei8KCnRyYW5zcG9ydHMYASADKAsyDy5tYWluLlRyYW5zcG9ydFIKdH'
    'JhbnNwb3J0cw==');

@$core.Deprecated('Use garageFacilityListDescriptor instead')
const GarageFacilityList$json = {
  '1': 'GarageFacilityList',
  '2': [
    {'1': 'garages', '3': 1, '4': 3, '5': 11, '6': '.main.GarageFacility', '10': 'garages'},
  ],
};

/// Descriptor for `GarageFacilityList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List garageFacilityListDescriptor = $convert.base64Decode(
    'ChJHYXJhZ2VGYWNpbGl0eUxpc3QSLgoHZ2FyYWdlcxgBIAMoCzIULm1haW4uR2FyYWdlRmFjaW'
    'xpdHlSB2dhcmFnZXM=');

@$core.Deprecated('Use transportOperationListDescriptor instead')
const TransportOperationList$json = {
  '1': 'TransportOperationList',
  '2': [
    {'1': 'operations', '3': 1, '4': 3, '5': 11, '6': '.main.TransportOperation', '10': 'operations'},
  ],
};

/// Descriptor for `TransportOperationList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportOperationListDescriptor = $convert.base64Decode(
    'ChZUcmFuc3BvcnRPcGVyYXRpb25MaXN0EjgKCm9wZXJhdGlvbnMYASADKAsyGC5tYWluLlRyYW'
    '5zcG9ydE9wZXJhdGlvblIKb3BlcmF0aW9ucw==');

@$core.Deprecated('Use transportFilterDescriptor instead')
const TransportFilter$json = {
  '1': 'TransportFilter',
  '2': [
    {'1': 'routeId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'routeId', '17': true},
    {'1': 'garageFacilityId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'garageFacilityId', '17': true},
    {'1': 'ids', '3': 3, '4': 3, '5': 5, '10': 'ids'},
  ],
  '8': [
    {'1': '_routeId'},
    {'1': '_garageFacilityId'},
  ],
};

/// Descriptor for `TransportFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportFilterDescriptor = $convert.base64Decode(
    'Cg9UcmFuc3BvcnRGaWx0ZXISHQoHcm91dGVJZBgBIAEoBUgAUgdyb3V0ZUlkiAEBEi8KEGdhcm'
    'FnZUZhY2lsaXR5SWQYAiABKAVIAVIQZ2FyYWdlRmFjaWxpdHlJZIgBARIQCgNpZHMYAyADKAVS'
    'A2lkc0IKCghfcm91dGVJZEITChFfZ2FyYWdlRmFjaWxpdHlJZA==');

@$core.Deprecated('Use modifyRouteRequestDescriptor instead')
const ModifyRouteRequest$json = {
  '1': 'ModifyRouteRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'transportId', '3': 2, '4': 3, '5': 5, '10': 'transportId'},
  ],
};

/// Descriptor for `ModifyRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modifyRouteRequestDescriptor = $convert.base64Decode(
    'ChJNb2RpZnlSb3V0ZVJlcXVlc3QSDgoCaWQYASABKAVSAmlkEiAKC3RyYW5zcG9ydElkGAIgAy'
    'gFUgt0cmFuc3BvcnRJZA==');

@$core.Deprecated('Use routeDescriptor instead')
const Route$json = {
  '1': 'Route',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'transport', '3': 3, '4': 3, '5': 11, '6': '.main.Transport', '10': 'transport'},
  ],
  '8': [
    {'1': '_id'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode(
    'CgVSb3V0ZRITCgJpZBgBIAEoBUgAUgJpZIgBARISCgRuYW1lGAIgASgJUgRuYW1lEi0KCXRyYW'
    '5zcG9ydBgDIAMoCzIPLm1haW4uVHJhbnNwb3J0Ugl0cmFuc3BvcnRCBQoDX2lk');

@$core.Deprecated('Use routeListDescriptor instead')
const RouteList$json = {
  '1': 'RouteList',
  '2': [
    {'1': 'routes', '3': 1, '4': 3, '5': 11, '6': '.main.Route', '10': 'routes'},
  ],
};

/// Descriptor for `RouteList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeListDescriptor = $convert.base64Decode(
    'CglSb3V0ZUxpc3QSIwoGcm91dGVzGAEgAygLMgsubWFpbi5Sb3V0ZVIGcm91dGVz');

@$core.Deprecated('Use getRouteByTransportIdRequestDescriptor instead')
const GetRouteByTransportIdRequest$json = {
  '1': 'GetRouteByTransportIdRequest',
  '2': [
    {'1': 'transportId', '3': 1, '4': 1, '5': 5, '10': 'transportId'},
  ],
};

/// Descriptor for `GetRouteByTransportIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRouteByTransportIdRequestDescriptor = $convert.base64Decode(
    'ChxHZXRSb3V0ZUJ5VHJhbnNwb3J0SWRSZXF1ZXN0EiAKC3RyYW5zcG9ydElkGAEgASgFUgt0cm'
    'Fuc3BvcnRJZA==');

@$core.Deprecated('Use operationFilterDescriptor instead')
const OperationFilter$json = {
  '1': 'OperationFilter',
  '2': [
    {'1': 'dateFrom', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateFrom'},
    {'1': 'dateTo', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTo'},
    {'1': 'ids', '3': 3, '4': 3, '5': 5, '10': 'ids'},
  ],
};

/// Descriptor for `OperationFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationFilterDescriptor = $convert.base64Decode(
    'Cg9PcGVyYXRpb25GaWx0ZXISNgoIZGF0ZUZyb20YASABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUghkYXRlRnJvbRIyCgZkYXRlVG8YAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgZkYXRlVG8SEAoDaWRzGAMgAygFUgNpZHM=');

