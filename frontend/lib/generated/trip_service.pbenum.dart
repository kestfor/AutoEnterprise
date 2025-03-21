//
//  Generated code. Do not modify.
//  source: trip_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TripType extends $pb.ProtobufEnum {
  static const TripType cargo = TripType._(0, _omitEnumNames ? '' : 'cargo');
  static const TripType passenger = TripType._(1, _omitEnumNames ? '' : 'passenger');

  static const $core.List<TripType> values = <TripType> [
    cargo,
    passenger,
  ];

  static final $core.Map<$core.int, TripType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TripType? valueOf($core.int value) => _byValue[value];

  const TripType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
