//
//  Generated code. Do not modify.
//  source: person_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'foreman', '2': 0},
    {'1': 'master', '2': 1},
    {'1': 'manager', '2': 2},
    {'1': 'driver', '2': 3},
    {'1': 'technician', '2': 4},
    {'1': 'welder', '2': 5},
    {'1': 'assembler', '2': 6},
    {'1': 'plumber', '2': 7},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEgsKB2ZvcmVtYW4QABIKCgZtYXN0ZXIQARILCgdtYW5hZ2VyEAISCgoGZHJpdmVyEA'
    'MSDgoKdGVjaG5pY2lhbhAEEgoKBndlbGRlchAFEg0KCWFzc2VtYmxlchAGEgsKB3BsdW1iZXIQ'
    'Bw==');

@$core.Deprecated('Use repairStateDescriptor instead')
const RepairState$json = {
  '1': 'RepairState',
  '2': [
    {'1': 'in_progress', '2': 0},
    {'1': 'finished', '2': 1},
    {'1': 'not_started', '2': 2},
  ],
};

/// Descriptor for `RepairState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List repairStateDescriptor = $convert.base64Decode(
    'CgtSZXBhaXJTdGF0ZRIPCgtpbl9wcm9ncmVzcxAAEgwKCGZpbmlzaGVkEAESDwoLbm90X3N0YX'
    'J0ZWQQAg==');

@$core.Deprecated('Use transportUnitDescriptor instead')
const TransportUnit$json = {
  '1': 'TransportUnit',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'type', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_description'},
    {'1': '_type'},
  ],
};

/// Descriptor for `TransportUnit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportUnitDescriptor = $convert.base64Decode(
    'Cg1UcmFuc3BvcnRVbml0EhMKAmlkGAEgASgFSABSAmlkiAEBEhIKBG5hbWUYAiABKAlSBG5hbW'
    'USJQoLZGVzY3JpcHRpb24YAyABKAlIAVILZGVzY3JpcHRpb26IAQESFwoEdHlwZRgEIAEoCUgC'
    'UgR0eXBliAEBQgUKA19pZEIOCgxfZGVzY3JpcHRpb25CBwoFX3R5cGU=');

@$core.Deprecated('Use repairWorkDescriptor instead')
const RepairWork$json = {
  '1': 'RepairWork',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'startTime', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'endTime', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'endTime', '17': true},
    {'1': 'transportId', '3': 5, '4': 1, '5': 5, '10': 'transportId'},
    {'1': 'servicePersonnelId', '3': 6, '4': 1, '5': 5, '10': 'servicePersonnelId'},
    {'1': 'unitId', '3': 7, '4': 1, '5': 5, '9': 3, '10': 'unitId', '17': true},
    {'1': 'repairCost', '3': 8, '4': 1, '5': 2, '9': 4, '10': 'repairCost', '17': true},
    {'1': 'state', '3': 9, '4': 1, '5': 9, '10': 'state'},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_description'},
    {'1': '_endTime'},
    {'1': '_unitId'},
    {'1': '_repairCost'},
  ],
};

/// Descriptor for `RepairWork`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairWorkDescriptor = $convert.base64Decode(
    'CgpSZXBhaXJXb3JrEhMKAmlkGAEgASgFSABSAmlkiAEBEiUKC2Rlc2NyaXB0aW9uGAIgASgJSA'
    'FSC2Rlc2NyaXB0aW9uiAEBEjgKCXN0YXJ0VGltZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSCXN0YXJ0VGltZRI5CgdlbmRUaW1lGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcEgCUgdlbmRUaW1liAEBEiAKC3RyYW5zcG9ydElkGAUgASgFUgt0cmFuc3BvcnRJ'
    'ZBIuChJzZXJ2aWNlUGVyc29ubmVsSWQYBiABKAVSEnNlcnZpY2VQZXJzb25uZWxJZBIbCgZ1bm'
    'l0SWQYByABKAVIA1IGdW5pdElkiAEBEiMKCnJlcGFpckNvc3QYCCABKAJIBFIKcmVwYWlyQ29z'
    'dIgBARIUCgVzdGF0ZRgJIAEoCVIFc3RhdGVCBQoDX2lkQg4KDF9kZXNjcmlwdGlvbkIKCghfZW'
    '5kVGltZUIJCgdfdW5pdElkQg0KC19yZXBhaXJDb3N0');

@$core.Deprecated('Use brigadeDescriptor instead')
const Brigade$json = {
  '1': 'Brigade',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'foremanId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'foremanId', '17': true},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_foremanId'},
  ],
};

/// Descriptor for `Brigade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List brigadeDescriptor = $convert.base64Decode(
    'CgdCcmlnYWRlEhMKAmlkGAEgASgFSABSAmlkiAEBEiEKCWZvcmVtYW5JZBgCIAEoBUgBUglmb3'
    'JlbWFuSWSIAQESEgoEbmFtZRgDIAEoCVIEbmFtZUIFCgNfaWRCDAoKX2ZvcmVtYW5JZA==');

@$core.Deprecated('Use driverInfoDescriptor instead')
const DriverInfo$json = {
  '1': 'DriverInfo',
  '2': [
    {'1': 'transportId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'transportId', '17': true},
    {'1': 'brigadeId', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'brigadeId', '17': true},
  ],
  '8': [
    {'1': '_transportId'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `DriverInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List driverInfoDescriptor = $convert.base64Decode(
    'CgpEcml2ZXJJbmZvEiUKC3RyYW5zcG9ydElkGAEgASgFSABSC3RyYW5zcG9ydElkiAEBEiEKCW'
    'JyaWdhZGVJZBgDIAEoBUgBUglicmlnYWRlSWSIAQFCDgoMX3RyYW5zcG9ydElkQgwKCl9icmln'
    'YWRlSWQ=');

@$core.Deprecated('Use foremanInfoDescriptor instead')
const ForemanInfo$json = {
  '1': 'ForemanInfo',
  '2': [
    {'1': 'masterId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'masterId', '17': true},
    {'1': 'serviceCenter', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'serviceCenter', '17': true},
    {'1': 'certification', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'certification', '17': true},
  ],
  '8': [
    {'1': '_masterId'},
    {'1': '_serviceCenter'},
    {'1': '_certification'},
  ],
};

/// Descriptor for `ForemanInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List foremanInfoDescriptor = $convert.base64Decode(
    'CgtGb3JlbWFuSW5mbxIfCghtYXN0ZXJJZBgBIAEoBUgAUghtYXN0ZXJJZIgBARIpCg1zZXJ2aW'
    'NlQ2VudGVyGAMgASgJSAFSDXNlcnZpY2VDZW50ZXKIAQESKQoNY2VydGlmaWNhdGlvbhgEIAEo'
    'CUgCUg1jZXJ0aWZpY2F0aW9uiAEBQgsKCV9tYXN0ZXJJZEIQCg5fc2VydmljZUNlbnRlckIQCg'
    '5fY2VydGlmaWNhdGlvbg==');

@$core.Deprecated('Use masterInfoDescriptor instead')
const MasterInfo$json = {
  '1': 'MasterInfo',
  '2': [
    {'1': 'managerId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'managerId', '17': true},
  ],
  '8': [
    {'1': '_managerId'},
  ],
};

/// Descriptor for `MasterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List masterInfoDescriptor = $convert.base64Decode(
    'CgpNYXN0ZXJJbmZvEiEKCW1hbmFnZXJJZBgBIAEoBUgAUgltYW5hZ2VySWSIAQFCDAoKX21hbm'
    'FnZXJJZA==');

@$core.Deprecated('Use managerInfoDescriptor instead')
const ManagerInfo$json = {
  '1': 'ManagerInfo',
  '2': [
    {'1': 'department', '3': 2, '4': 1, '5': 9, '10': 'department'},
    {'1': 'managementExperienceYears', '3': 3, '4': 1, '5': 5, '10': 'managementExperienceYears'},
  ],
};

/// Descriptor for `ManagerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List managerInfoDescriptor = $convert.base64Decode(
    'CgtNYW5hZ2VySW5mbxIeCgpkZXBhcnRtZW50GAIgASgJUgpkZXBhcnRtZW50EjwKGW1hbmFnZW'
    '1lbnRFeHBlcmllbmNlWWVhcnMYAyABKAVSGW1hbmFnZW1lbnRFeHBlcmllbmNlWWVhcnM=');

@$core.Deprecated('Use assemblerInfoDescriptor instead')
const AssemblerInfo$json = {
  '1': 'AssemblerInfo',
  '2': [
    {'1': 'experienceYears', '3': 2, '4': 1, '5': 5, '10': 'experienceYears'},
    {'1': 'specialization', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'specialization', '17': true},
    {'1': 'certification', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'certification', '17': true},
    {'1': 'brigadeId', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'brigadeId', '17': true},
  ],
  '8': [
    {'1': '_specialization'},
    {'1': '_certification'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `AssemblerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assemblerInfoDescriptor = $convert.base64Decode(
    'Cg1Bc3NlbWJsZXJJbmZvEigKD2V4cGVyaWVuY2VZZWFycxgCIAEoBVIPZXhwZXJpZW5jZVllYX'
    'JzEisKDnNwZWNpYWxpemF0aW9uGAMgASgJSABSDnNwZWNpYWxpemF0aW9uiAEBEikKDWNlcnRp'
    'ZmljYXRpb24YBCABKAlIAVINY2VydGlmaWNhdGlvbogBARIhCglicmlnYWRlSWQYBSABKAVIAl'
    'IJYnJpZ2FkZUlkiAEBQhEKD19zcGVjaWFsaXphdGlvbkIQCg5fY2VydGlmaWNhdGlvbkIMCgpf'
    'YnJpZ2FkZUlk');

@$core.Deprecated('Use plumberInfoDescriptor instead')
const PlumberInfo$json = {
  '1': 'PlumberInfo',
  '2': [
    {'1': 'specialization', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'specialization', '17': true},
    {'1': 'certification', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'certification', '17': true},
    {'1': 'safetyTraining', '3': 4, '4': 1, '5': 8, '10': 'safetyTraining'},
    {'1': 'brigadeId', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'brigadeId', '17': true},
  ],
  '8': [
    {'1': '_specialization'},
    {'1': '_certification'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `PlumberInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List plumberInfoDescriptor = $convert.base64Decode(
    'CgtQbHVtYmVySW5mbxIrCg5zcGVjaWFsaXphdGlvbhgCIAEoCUgAUg5zcGVjaWFsaXphdGlvbo'
    'gBARIpCg1jZXJ0aWZpY2F0aW9uGAMgASgJSAFSDWNlcnRpZmljYXRpb26IAQESJgoOc2FmZXR5'
    'VHJhaW5pbmcYBCABKAhSDnNhZmV0eVRyYWluaW5nEiEKCWJyaWdhZGVJZBgFIAEoBUgCUglicm'
    'lnYWRlSWSIAQFCEQoPX3NwZWNpYWxpemF0aW9uQhAKDl9jZXJ0aWZpY2F0aW9uQgwKCl9icmln'
    'YWRlSWQ=');

@$core.Deprecated('Use technicianInfoDescriptor instead')
const TechnicianInfo$json = {
  '1': 'TechnicianInfo',
  '2': [
    {'1': 'fieldOfExpertise', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'fieldOfExpertise', '17': true},
    {'1': 'certification', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'certification', '17': true},
    {'1': 'brigadeId', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'brigadeId', '17': true},
  ],
  '8': [
    {'1': '_fieldOfExpertise'},
    {'1': '_certification'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `TechnicianInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List technicianInfoDescriptor = $convert.base64Decode(
    'Cg5UZWNobmljaWFuSW5mbxIvChBmaWVsZE9mRXhwZXJ0aXNlGAIgASgJSABSEGZpZWxkT2ZFeH'
    'BlcnRpc2WIAQESKQoNY2VydGlmaWNhdGlvbhgDIAEoCUgBUg1jZXJ0aWZpY2F0aW9uiAEBEiEK'
    'CWJyaWdhZGVJZBgFIAEoBUgCUglicmlnYWRlSWSIAQFCEwoRX2ZpZWxkT2ZFeHBlcnRpc2VCEA'
    'oOX2NlcnRpZmljYXRpb25CDAoKX2JyaWdhZGVJZA==');

@$core.Deprecated('Use welderInfoDescriptor instead')
const WelderInfo$json = {
  '1': 'WelderInfo',
  '2': [
    {'1': 'weldingType', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'weldingType', '17': true},
    {'1': 'certification', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'certification', '17': true},
    {'1': 'safetyTraining', '3': 4, '4': 1, '5': 8, '10': 'safetyTraining'},
    {'1': 'brigadeId', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'brigadeId', '17': true},
  ],
  '8': [
    {'1': '_weldingType'},
    {'1': '_certification'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `WelderInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List welderInfoDescriptor = $convert.base64Decode(
    'CgpXZWxkZXJJbmZvEiUKC3dlbGRpbmdUeXBlGAIgASgJSABSC3dlbGRpbmdUeXBliAEBEikKDW'
    'NlcnRpZmljYXRpb24YAyABKAlIAVINY2VydGlmaWNhdGlvbogBARImCg5zYWZldHlUcmFpbmlu'
    'ZxgEIAEoCFIOc2FmZXR5VHJhaW5pbmcSIQoJYnJpZ2FkZUlkGAUgASgFSAJSCWJyaWdhZGVJZI'
    'gBAUIOCgxfd2VsZGluZ1R5cGVCEAoOX2NlcnRpZmljYXRpb25CDAoKX2JyaWdhZGVJZA==');

@$core.Deprecated('Use personDescriptor instead')
const Person$json = {
  '1': 'Person',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 1, '10': 'id', '17': true},
    {'1': 'firstName', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'secondName', '3': 3, '4': 1, '5': 9, '10': 'secondName'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
    {'1': 'birthDate', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
    {'1': 'phoneNumber', '3': 14, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 15, '4': 1, '5': 9, '10': 'email'},
    {'1': 'salary', '3': 16, '4': 1, '5': 2, '10': 'salary'},
    {'1': 'foremanInfo', '3': 5, '4': 1, '5': 11, '6': '.main.ForemanInfo', '9': 0, '10': 'foremanInfo'},
    {'1': 'masterInfo', '3': 6, '4': 1, '5': 11, '6': '.main.MasterInfo', '9': 0, '10': 'masterInfo'},
    {'1': 'managerInfo', '3': 7, '4': 1, '5': 11, '6': '.main.ManagerInfo', '9': 0, '10': 'managerInfo'},
    {'1': 'driverInfo', '3': 8, '4': 1, '5': 11, '6': '.main.DriverInfo', '9': 0, '10': 'driverInfo'},
    {'1': 'technicianInfo', '3': 9, '4': 1, '5': 11, '6': '.main.TechnicianInfo', '9': 0, '10': 'technicianInfo'},
    {'1': 'welderInfo', '3': 10, '4': 1, '5': 11, '6': '.main.WelderInfo', '9': 0, '10': 'welderInfo'},
    {'1': 'assemblerInfo', '3': 11, '4': 1, '5': 11, '6': '.main.AssemblerInfo', '9': 0, '10': 'assemblerInfo'},
    {'1': 'plumberInfo', '3': 12, '4': 1, '5': 11, '6': '.main.PlumberInfo', '9': 0, '10': 'plumberInfo'},
  ],
  '8': [
    {'1': 'personInfo'},
    {'1': '_id'},
  ],
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode(
    'CgZQZXJzb24SEwoCaWQYASABKAVIAVICaWSIAQESHAoJZmlyc3ROYW1lGAIgASgJUglmaXJzdE'
    '5hbWUSHgoKc2Vjb25kTmFtZRgDIAEoCVIKc2Vjb25kTmFtZRISCgRyb2xlGAQgASgJUgRyb2xl'
    'EjgKCWJpcnRoRGF0ZRgNIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWJpcnRoRG'
    'F0ZRIgCgtwaG9uZU51bWJlchgOIAEoCVILcGhvbmVOdW1iZXISFAoFZW1haWwYDyABKAlSBWVt'
    'YWlsEhYKBnNhbGFyeRgQIAEoAlIGc2FsYXJ5EjUKC2ZvcmVtYW5JbmZvGAUgASgLMhEubWFpbi'
    '5Gb3JlbWFuSW5mb0gAUgtmb3JlbWFuSW5mbxIyCgptYXN0ZXJJbmZvGAYgASgLMhAubWFpbi5N'
    'YXN0ZXJJbmZvSABSCm1hc3RlckluZm8SNQoLbWFuYWdlckluZm8YByABKAsyES5tYWluLk1hbm'
    'FnZXJJbmZvSABSC21hbmFnZXJJbmZvEjIKCmRyaXZlckluZm8YCCABKAsyEC5tYWluLkRyaXZl'
    'ckluZm9IAFIKZHJpdmVySW5mbxI+Cg50ZWNobmljaWFuSW5mbxgJIAEoCzIULm1haW4uVGVjaG'
    '5pY2lhbkluZm9IAFIOdGVjaG5pY2lhbkluZm8SMgoKd2VsZGVySW5mbxgKIAEoCzIQLm1haW4u'
    'V2VsZGVySW5mb0gAUgp3ZWxkZXJJbmZvEjsKDWFzc2VtYmxlckluZm8YCyABKAsyEy5tYWluLk'
    'Fzc2VtYmxlckluZm9IAFINYXNzZW1ibGVySW5mbxI1CgtwbHVtYmVySW5mbxgMIAEoCzIRLm1h'
    'aW4uUGx1bWJlckluZm9IAFILcGx1bWJlckluZm9CDAoKcGVyc29uSW5mb0IFCgNfaWQ=');

@$core.Deprecated('Use personListDescriptor instead')
const PersonList$json = {
  '1': 'PersonList',
  '2': [
    {'1': 'persons', '3': 1, '4': 3, '5': 11, '6': '.main.Person', '10': 'persons'},
  ],
};

/// Descriptor for `PersonList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personListDescriptor = $convert.base64Decode(
    'CgpQZXJzb25MaXN0EiYKB3BlcnNvbnMYASADKAsyDC5tYWluLlBlcnNvblIHcGVyc29ucw==');

@$core.Deprecated('Use brigadeListDescriptor instead')
const BrigadeList$json = {
  '1': 'BrigadeList',
  '2': [
    {'1': 'brigades', '3': 1, '4': 3, '5': 11, '6': '.main.Brigade', '10': 'brigades'},
  ],
};

/// Descriptor for `BrigadeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List brigadeListDescriptor = $convert.base64Decode(
    'CgtCcmlnYWRlTGlzdBIpCghicmlnYWRlcxgBIAMoCzINLm1haW4uQnJpZ2FkZVIIYnJpZ2FkZX'
    'M=');

@$core.Deprecated('Use repairWorkListDescriptor instead')
const RepairWorkList$json = {
  '1': 'RepairWorkList',
  '2': [
    {'1': 'repairWorks', '3': 1, '4': 3, '5': 11, '6': '.main.RepairWork', '10': 'repairWorks'},
  ],
};

/// Descriptor for `RepairWorkList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairWorkListDescriptor = $convert.base64Decode(
    'Cg5SZXBhaXJXb3JrTGlzdBIyCgtyZXBhaXJXb3JrcxgBIAMoCzIQLm1haW4uUmVwYWlyV29ya1'
    'ILcmVwYWlyV29ya3M=');

@$core.Deprecated('Use masterFilterDescriptor instead')
const MasterFilter$json = {
  '1': 'MasterFilter',
  '2': [
    {'1': 'managerId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'managerId', '17': true},
  ],
  '8': [
    {'1': '_managerId'},
  ],
};

/// Descriptor for `MasterFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List masterFilterDescriptor = $convert.base64Decode(
    'CgxNYXN0ZXJGaWx0ZXISIQoJbWFuYWdlcklkGAEgASgFSABSCW1hbmFnZXJJZIgBAUIMCgpfbW'
    'FuYWdlcklk');

@$core.Deprecated('Use foremanFilterDescriptor instead')
const ForemanFilter$json = {
  '1': 'ForemanFilter',
  '2': [
    {'1': 'masterId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'masterId', '17': true},
  ],
  '8': [
    {'1': '_masterId'},
  ],
};

/// Descriptor for `ForemanFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List foremanFilterDescriptor = $convert.base64Decode(
    'Cg1Gb3JlbWFuRmlsdGVyEh8KCG1hc3RlcklkGAEgASgFSABSCG1hc3RlcklkiAEBQgsKCV9tYX'
    'N0ZXJJZA==');

@$core.Deprecated('Use servicePersonnelFilterDescriptor instead')
const ServicePersonnelFilter$json = {
  '1': 'ServicePersonnelFilter',
  '2': [
    {'1': 'foremanId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'foremanId', '17': true},
  ],
  '8': [
    {'1': '_foremanId'},
  ],
};

/// Descriptor for `ServicePersonnelFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List servicePersonnelFilterDescriptor = $convert.base64Decode(
    'ChZTZXJ2aWNlUGVyc29ubmVsRmlsdGVyEiEKCWZvcmVtYW5JZBgBIAEoBUgAUglmb3JlbWFuSW'
    'SIAQFCDAoKX2ZvcmVtYW5JZA==');

@$core.Deprecated('Use personFilterDescriptor instead')
const PersonFilter$json = {
  '1': 'PersonFilter',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 14, '6': '.main.Role', '10': 'roles'},
    {'1': 'brigadeId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'brigadeId', '17': true},
    {'1': 'ids', '3': 3, '4': 3, '5': 5, '10': 'ids'},
    {'1': 'masterFilter', '3': 4, '4': 1, '5': 11, '6': '.main.MasterFilter', '9': 0, '10': 'masterFilter'},
    {'1': 'foremanFilter', '3': 5, '4': 1, '5': 11, '6': '.main.ForemanFilter', '9': 0, '10': 'foremanFilter'},
    {'1': 'servicePersonnelFilter', '3': 6, '4': 1, '5': 11, '6': '.main.ServicePersonnelFilter', '9': 0, '10': 'servicePersonnelFilter'},
  ],
  '8': [
    {'1': 'roleBasedFilter'},
    {'1': '_brigadeId'},
  ],
};

/// Descriptor for `PersonFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personFilterDescriptor = $convert.base64Decode(
    'CgxQZXJzb25GaWx0ZXISIAoFcm9sZXMYASADKA4yCi5tYWluLlJvbGVSBXJvbGVzEiEKCWJyaW'
    'dhZGVJZBgCIAEoBUgBUglicmlnYWRlSWSIAQESEAoDaWRzGAMgAygFUgNpZHMSOAoMbWFzdGVy'
    'RmlsdGVyGAQgASgLMhIubWFpbi5NYXN0ZXJGaWx0ZXJIAFIMbWFzdGVyRmlsdGVyEjsKDWZvcm'
    'VtYW5GaWx0ZXIYBSABKAsyEy5tYWluLkZvcmVtYW5GaWx0ZXJIAFINZm9yZW1hbkZpbHRlchJW'
    'ChZzZXJ2aWNlUGVyc29ubmVsRmlsdGVyGAYgASgLMhwubWFpbi5TZXJ2aWNlUGVyc29ubmVsRm'
    'lsdGVySABSFnNlcnZpY2VQZXJzb25uZWxGaWx0ZXJCEQoPcm9sZUJhc2VkRmlsdGVyQgwKCl9i'
    'cmlnYWRlSWQ=');

@$core.Deprecated('Use repairWorkFilterDescriptor instead')
const RepairWorkFilter$json = {
  '1': 'RepairWorkFilter',
  '2': [
    {'1': 'transportBrand', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'transportBrand', '17': true},
    {'1': 'transportType', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'transportType', '17': true},
    {'1': 'states', '3': 1, '4': 3, '5': 14, '6': '.main.RepairState', '10': 'states'},
    {'1': 'brigadeId', '3': 2, '4': 1, '5': 5, '9': 2, '10': 'brigadeId', '17': true},
    {'1': 'dateRange', '3': 3, '4': 1, '5': 11, '6': '.main.RepairWorkFilter.DateRange', '9': 3, '10': 'dateRange', '17': true},
    {'1': 'transportId', '3': 4, '4': 1, '5': 5, '9': 4, '10': 'transportId', '17': true},
    {'1': 'servicePersonnelId', '3': 5, '4': 1, '5': 5, '9': 5, '10': 'servicePersonnelId', '17': true},
    {'1': 'unitId', '3': 6, '4': 1, '5': 5, '9': 6, '10': 'unitId', '17': true},
    {'1': 'ids', '3': 9, '4': 3, '5': 5, '10': 'ids'},
  ],
  '3': [RepairWorkFilter_DateRange$json],
  '8': [
    {'1': '_transportBrand'},
    {'1': '_transportType'},
    {'1': '_brigadeId'},
    {'1': '_dateRange'},
    {'1': '_transportId'},
    {'1': '_servicePersonnelId'},
    {'1': '_unitId'},
  ],
};

@$core.Deprecated('Use repairWorkFilterDescriptor instead')
const RepairWorkFilter_DateRange$json = {
  '1': 'DateRange',
  '2': [
    {'1': 'dateFrom', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateFrom'},
    {'1': 'dateTo', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTo'},
  ],
};

/// Descriptor for `RepairWorkFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repairWorkFilterDescriptor = $convert.base64Decode(
    'ChBSZXBhaXJXb3JrRmlsdGVyEisKDnRyYW5zcG9ydEJyYW5kGAcgASgJSABSDnRyYW5zcG9ydE'
    'JyYW5kiAEBEikKDXRyYW5zcG9ydFR5cGUYCCABKAlIAVINdHJhbnNwb3J0VHlwZYgBARIpCgZz'
    'dGF0ZXMYASADKA4yES5tYWluLlJlcGFpclN0YXRlUgZzdGF0ZXMSIQoJYnJpZ2FkZUlkGAIgAS'
    'gFSAJSCWJyaWdhZGVJZIgBARJDCglkYXRlUmFuZ2UYAyABKAsyIC5tYWluLlJlcGFpcldvcmtG'
    'aWx0ZXIuRGF0ZVJhbmdlSANSCWRhdGVSYW5nZYgBARIlCgt0cmFuc3BvcnRJZBgEIAEoBUgEUg'
    't0cmFuc3BvcnRJZIgBARIzChJzZXJ2aWNlUGVyc29ubmVsSWQYBSABKAVIBVISc2VydmljZVBl'
    'cnNvbm5lbElkiAEBEhsKBnVuaXRJZBgGIAEoBUgGUgZ1bml0SWSIAQESEAoDaWRzGAkgAygFUg'
    'NpZHMadwoJRGF0ZVJhbmdlEjYKCGRhdGVGcm9tGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFIIZGF0ZUZyb20SMgoGZGF0ZVRvGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIGZGF0ZVRvQhEKD190cmFuc3BvcnRCcmFuZEIQCg5fdHJhbnNwb3J0VHlwZUIMCgpf'
    'YnJpZ2FkZUlkQgwKCl9kYXRlUmFuZ2VCDgoMX3RyYW5zcG9ydElkQhUKE19zZXJ2aWNlUGVyc2'
    '9ubmVsSWRCCQoHX3VuaXRJZA==');

@$core.Deprecated('Use transportUnitListDescriptor instead')
const TransportUnitList$json = {
  '1': 'TransportUnitList',
  '2': [
    {'1': 'units', '3': 1, '4': 3, '5': 11, '6': '.main.TransportUnit', '10': 'units'},
  ],
};

/// Descriptor for `TransportUnitList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transportUnitListDescriptor = $convert.base64Decode(
    'ChFUcmFuc3BvcnRVbml0TGlzdBIpCgV1bml0cxgBIAMoCzITLm1haW4uVHJhbnNwb3J0VW5pdF'
    'IFdW5pdHM=');

@$core.Deprecated('Use driversRequestDescriptor instead')
const DriversRequest$json = {
  '1': 'DriversRequest',
  '2': [
    {'1': 'transportId', '3': 1, '4': 1, '5': 5, '10': 'transportId'},
  ],
};

/// Descriptor for `DriversRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List driversRequestDescriptor = $convert.base64Decode(
    'Cg5Ecml2ZXJzUmVxdWVzdBIgCgt0cmFuc3BvcnRJZBgBIAEoBVILdHJhbnNwb3J0SWQ=');

