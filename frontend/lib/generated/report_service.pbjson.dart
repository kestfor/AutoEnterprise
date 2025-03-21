//
//  Generated code. Do not modify.
//  source: report_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use carMileageRequestDescriptor instead')
const CarMileageRequest$json = {
  '1': 'CarMileageRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'category', '17': true},
    {'1': 'transportId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'transportId', '17': true},
    {'1': 'dateFrom', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateFrom'},
    {'1': 'dateTo', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTo'},
  ],
  '8': [
    {'1': '_category'},
    {'1': '_transportId'},
  ],
};

/// Descriptor for `CarMileageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List carMileageRequestDescriptor = $convert.base64Decode(
    'ChFDYXJNaWxlYWdlUmVxdWVzdBIfCghjYXRlZ29yeRgBIAEoCUgAUghjYXRlZ29yeYgBARIlCg'
    't0cmFuc3BvcnRJZBgCIAEoBUgBUgt0cmFuc3BvcnRJZIgBARI2CghkYXRlRnJvbRgDIAEoCzIa'
    'Lmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGRhdGVGcm9tEjIKBmRhdGVUbxgEIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBmRhdGVUb0ILCglfY2F0ZWdvcnlCDgoMX3RyYW5z'
    'cG9ydElk');

@$core.Deprecated('Use repairCostRequestDescriptor instead')
const RepairCostRequest$json = {
  '1': 'RepairCostRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'category', '17': true},
    {'1': 'brand', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'brand', '17': true},
    {'1': 'transportId', '3': 2, '4': 1, '5': 5, '9': 2, '10': 'transportId', '17': true},
    {'1': 'dateFrom', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateFrom'},
    {'1': 'dateTo', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTo'},
  ],
  '8': [
    {'1': '_category'},
    {'1': '_brand'},
    {'1': '_transportId'},
  ],
};

/// Descriptor for `RepairCostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairCostRequestDescriptor = $convert.base64Decode(
    'ChFSZXBhaXJDb3N0UmVxdWVzdBIfCghjYXRlZ29yeRgBIAEoCUgAUghjYXRlZ29yeYgBARIZCg'
    'VicmFuZBgFIAEoCUgBUgVicmFuZIgBARIlCgt0cmFuc3BvcnRJZBgCIAEoBUgCUgt0cmFuc3Bv'
    'cnRJZIgBARI2CghkYXRlRnJvbRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCG'
    'RhdGVGcm9tEjIKBmRhdGVUbxgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBmRh'
    'dGVUb0ILCglfY2F0ZWdvcnlCCAoGX2JyYW5kQg4KDF90cmFuc3BvcnRJZA==');

@$core.Deprecated('Use carMileageResponseDescriptor instead')
const CarMileageResponse$json = {
  '1': 'CarMileageResponse',
  '2': [
    {'1': 'carMileage', '3': 1, '4': 3, '5': 11, '6': '.main.CarMileageResponse.CarMileageEntry', '10': 'carMileage'},
  ],
  '3': [CarMileageResponse_CarMileageEntry$json],
};

@$core.Deprecated('Use carMileageResponseDescriptor instead')
const CarMileageResponse_CarMileageEntry$json = {
  '1': 'CarMileageEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 2, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CarMileageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List carMileageResponseDescriptor = $convert.base64Decode(
    'ChJDYXJNaWxlYWdlUmVzcG9uc2USSAoKY2FyTWlsZWFnZRgBIAMoCzIoLm1haW4uQ2FyTWlsZW'
    'FnZVJlc3BvbnNlLkNhck1pbGVhZ2VFbnRyeVIKY2FyTWlsZWFnZRo9Cg9DYXJNaWxlYWdlRW50'
    'cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAJSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use repairCostDescriptor instead')
const RepairCost$json = {
  '1': 'RepairCost',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'sum', '3': 2, '4': 1, '5': 2, '10': 'sum'},
    {'1': 'repairNum', '3': 3, '4': 1, '5': 5, '10': 'repairNum'},
  ],
};

/// Descriptor for `RepairCost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairCostDescriptor = $convert.base64Decode(
    'CgpSZXBhaXJDb3N0EhIKBG5hbWUYASABKAlSBG5hbWUSEAoDc3VtGAIgASgCUgNzdW0SHAoJcm'
    'VwYWlyTnVtGAMgASgFUglyZXBhaXJOdW0=');

@$core.Deprecated('Use repairCostResponseDescriptor instead')
const RepairCostResponse$json = {
  '1': 'RepairCostResponse',
  '2': [
    {'1': 'costs', '3': 1, '4': 3, '5': 11, '6': '.main.RepairCost', '10': 'costs'},
  ],
};

/// Descriptor for `RepairCostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairCostResponseDescriptor = $convert.base64Decode(
    'ChJSZXBhaXJDb3N0UmVzcG9uc2USJgoFY29zdHMYASADKAsyEC5tYWluLlJlcGFpckNvc3RSBW'
    'Nvc3Rz');

@$core.Deprecated('Use driversDistributionResponseDescriptor instead')
const DriversDistributionResponse$json = {
  '1': 'DriversDistributionResponse',
  '2': [
    {'1': 'driversDistribution', '3': 1, '4': 3, '5': 11, '6': '.main.DriversDistributionResponse.DriversDistributionEntry', '10': 'driversDistribution'},
  ],
  '3': [DriversDistributionResponse_DriversDistributionEntry$json],
};

@$core.Deprecated('Use driversDistributionResponseDescriptor instead')
const DriversDistributionResponse_DriversDistributionEntry$json = {
  '1': 'DriversDistributionEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DriversDistributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List driversDistributionResponseDescriptor = $convert.base64Decode(
    'ChtEcml2ZXJzRGlzdHJpYnV0aW9uUmVzcG9uc2USbAoTZHJpdmVyc0Rpc3RyaWJ1dGlvbhgBIA'
    'MoCzI6Lm1haW4uRHJpdmVyc0Rpc3RyaWJ1dGlvblJlc3BvbnNlLkRyaXZlcnNEaXN0cmlidXRp'
    'b25FbnRyeVITZHJpdmVyc0Rpc3RyaWJ1dGlvbhpGChhEcml2ZXJzRGlzdHJpYnV0aW9uRW50cn'
    'kSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use passengerTransportDistributionResponseDescriptor instead')
const PassengerTransportDistributionResponse$json = {
  '1': 'PassengerTransportDistributionResponse',
  '2': [
    {'1': 'passengerTransportDistribution', '3': 1, '4': 3, '5': 11, '6': '.main.PassengerTransportDistributionResponse.PassengerTransportDistributionEntry', '10': 'passengerTransportDistribution'},
  ],
  '3': [PassengerTransportDistributionResponse_PassengerTransportDistributionEntry$json],
};

@$core.Deprecated('Use passengerTransportDistributionResponseDescriptor instead')
const PassengerTransportDistributionResponse_PassengerTransportDistributionEntry$json = {
  '1': 'PassengerTransportDistributionEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PassengerTransportDistributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passengerTransportDistributionResponseDescriptor = $convert.base64Decode(
    'CiZQYXNzZW5nZXJUcmFuc3BvcnREaXN0cmlidXRpb25SZXNwb25zZRKYAQoecGFzc2VuZ2VyVH'
    'JhbnNwb3J0RGlzdHJpYnV0aW9uGAEgAygLMlAubWFpbi5QYXNzZW5nZXJUcmFuc3BvcnREaXN0'
    'cmlidXRpb25SZXNwb25zZS5QYXNzZW5nZXJUcmFuc3BvcnREaXN0cmlidXRpb25FbnRyeVIecG'
    'Fzc2VuZ2VyVHJhbnNwb3J0RGlzdHJpYnV0aW9uGlEKI1Bhc3NlbmdlclRyYW5zcG9ydERpc3Ry'
    'aWJ1dGlvbkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOA'
    'E=');

@$core.Deprecated('Use subordinationDescriptor instead')
const Subordination$json = {
  '1': 'Subordination',
  '2': [
    {'1': 'person_name', '3': 1, '4': 1, '5': 9, '10': 'personName'},
    {'1': 'person_id', '3': 2, '4': 1, '5': 5, '10': 'personId'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
    {'1': 'subordinates', '3': 3, '4': 3, '5': 11, '6': '.main.Subordination', '10': 'subordinates'},
  ],
};

/// Descriptor for `Subordination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subordinationDescriptor = $convert.base64Decode(
    'Cg1TdWJvcmRpbmF0aW9uEh8KC3BlcnNvbl9uYW1lGAEgASgJUgpwZXJzb25OYW1lEhsKCXBlcn'
    'Nvbl9pZBgCIAEoBVIIcGVyc29uSWQSEgoEcm9sZRgEIAEoCVIEcm9sZRI3CgxzdWJvcmRpbmF0'
    'ZXMYAyADKAsyEy5tYWluLlN1Ym9yZGluYXRpb25SDHN1Ym9yZGluYXRlcw==');

@$core.Deprecated('Use subordinationResponseDescriptor instead')
const SubordinationResponse$json = {
  '1': 'SubordinationResponse',
  '2': [
    {'1': 'subordinations', '3': 1, '4': 3, '5': 11, '6': '.main.Subordination', '10': 'subordinations'},
  ],
};

/// Descriptor for `SubordinationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subordinationResponseDescriptor = $convert.base64Decode(
    'ChVTdWJvcmRpbmF0aW9uUmVzcG9uc2USOwoOc3Vib3JkaW5hdGlvbnMYASADKAsyEy5tYWluLl'
    'N1Ym9yZGluYXRpb25SDnN1Ym9yZGluYXRpb25z');

@$core.Deprecated('Use transportByGarageDistributionResponseDescriptor instead')
const TransportByGarageDistributionResponse$json = {
  '1': 'TransportByGarageDistributionResponse',
  '2': [
    {'1': 'mapping', '3': 1, '4': 3, '5': 11, '6': '.main.TransportByGarageDistributionResponse.MappingEntry', '10': 'mapping'},
  ],
  '3': [TransportByGarageDistributionResponse_MappingEntry$json],
};

@$core.Deprecated('Use transportByGarageDistributionResponseDescriptor instead')
const TransportByGarageDistributionResponse_MappingEntry$json = {
  '1': 'MappingEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TransportByGarageDistributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportByGarageDistributionResponseDescriptor = $convert.base64Decode(
    'CiVUcmFuc3BvcnRCeUdhcmFnZURpc3RyaWJ1dGlvblJlc3BvbnNlElIKB21hcHBpbmcYASADKA'
    'syOC5tYWluLlRyYW5zcG9ydEJ5R2FyYWdlRGlzdHJpYnV0aW9uUmVzcG9uc2UuTWFwcGluZ0Vu'
    'dHJ5UgdtYXBwaW5nGjoKDE1hcHBpbmdFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZR'
    'gCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use subordinationRequestDescriptor instead')
const SubordinationRequest$json = {
  '1': 'SubordinationRequest',
  '2': [
    {'1': 'filter', '3': 1, '4': 1, '5': 11, '6': '.main.SubordinationRequest.Filter', '9': 0, '10': 'filter', '17': true},
  ],
  '3': [SubordinationRequest_Filter$json],
  '8': [
    {'1': '_filter'},
  ],
};

@$core.Deprecated('Use subordinationRequestDescriptor instead')
const SubordinationRequest_Filter$json = {
  '1': 'Filter',
  '2': [
    {'1': 'personId', '3': 1, '4': 1, '5': 5, '10': 'personId'},
    {'1': 'personRole', '3': 2, '4': 1, '5': 9, '10': 'personRole'},
  ],
};

/// Descriptor for `SubordinationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subordinationRequestDescriptor = $convert.base64Decode(
    'ChRTdWJvcmRpbmF0aW9uUmVxdWVzdBI+CgZmaWx0ZXIYASABKAsyIS5tYWluLlN1Ym9yZGluYX'
    'Rpb25SZXF1ZXN0LkZpbHRlckgAUgZmaWx0ZXKIAQEaRAoGRmlsdGVyEhoKCHBlcnNvbklkGAEg'
    'ASgFUghwZXJzb25JZBIeCgpwZXJzb25Sb2xlGAIgASgJUgpwZXJzb25Sb2xlQgkKB19maWx0ZX'
    'I=');

