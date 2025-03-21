//
//  Generated code. Do not modify.
//  source: person_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Role extends $pb.ProtobufEnum {
  static const Role foreman = Role._(0, _omitEnumNames ? '' : 'foreman');
  static const Role master = Role._(1, _omitEnumNames ? '' : 'master');
  static const Role manager = Role._(2, _omitEnumNames ? '' : 'manager');
  static const Role driver = Role._(3, _omitEnumNames ? '' : 'driver');
  static const Role technician = Role._(4, _omitEnumNames ? '' : 'technician');
  static const Role welder = Role._(5, _omitEnumNames ? '' : 'welder');
  static const Role assembler = Role._(6, _omitEnumNames ? '' : 'assembler');
  static const Role plumber = Role._(7, _omitEnumNames ? '' : 'plumber');

  static const $core.List<Role> values = <Role> [
    foreman,
    master,
    manager,
    driver,
    technician,
    welder,
    assembler,
    plumber,
  ];

  static final $core.Map<$core.int, Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Role? valueOf($core.int value) => _byValue[value];

  const Role._($core.int v, $core.String n) : super(v, n);
}

class RepairState extends $pb.ProtobufEnum {
  static const RepairState in_progress = RepairState._(0, _omitEnumNames ? '' : 'in_progress');
  static const RepairState finished = RepairState._(1, _omitEnumNames ? '' : 'finished');
  static const RepairState not_started = RepairState._(2, _omitEnumNames ? '' : 'not_started');

  static const $core.List<RepairState> values = <RepairState> [
    in_progress,
    finished,
    not_started,
  ];

  static final $core.Map<$core.int, RepairState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RepairState? valueOf($core.int value) => _byValue[value];

  const RepairState._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
