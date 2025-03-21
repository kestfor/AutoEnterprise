//
//  Generated code. Do not modify.
//  source: transport_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TransportType extends $pb.ProtobufEnum {
  static const TransportType bus = TransportType._(0, _omitEnumNames ? '' : 'bus');
  static const TransportType taxi = TransportType._(1, _omitEnumNames ? '' : 'taxi');
  static const TransportType tram = TransportType._(2, _omitEnumNames ? '' : 'tram');
  static const TransportType trolleybus = TransportType._(3, _omitEnumNames ? '' : 'trolleybus');
  static const TransportType truck = TransportType._(4, _omitEnumNames ? '' : 'truck');

  static const $core.List<TransportType> values = <TransportType> [
    bus,
    taxi,
    tram,
    trolleybus,
    truck,
  ];

  static final $core.Map<$core.int, TransportType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransportType? valueOf($core.int value) => _byValue[value];

  const TransportType._($core.int v, $core.String n) : super(v, n);
}

class GarageFacilityType extends $pb.ProtobufEnum {
  static const GarageFacilityType attached_garage = GarageFacilityType._(0, _omitEnumNames ? '' : 'attached_garage');
  static const GarageFacilityType detached_garage = GarageFacilityType._(1, _omitEnumNames ? '' : 'detached_garage');
  static const GarageFacilityType carport = GarageFacilityType._(2, _omitEnumNames ? '' : 'carport');

  static const $core.List<GarageFacilityType> values = <GarageFacilityType> [
    attached_garage,
    detached_garage,
    carport,
  ];

  static final $core.Map<$core.int, GarageFacilityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GarageFacilityType? valueOf($core.int value) => _byValue[value];

  const GarageFacilityType._($core.int v, $core.String n) : super(v, n);
}

class TransportOperationType extends $pb.ProtobufEnum {
  static const TransportOperationType purchase = TransportOperationType._(0, _omitEnumNames ? '' : 'purchase');
  static const TransportOperationType write_off = TransportOperationType._(1, _omitEnumNames ? '' : 'write_off');
  static const TransportOperationType sale = TransportOperationType._(2, _omitEnumNames ? '' : 'sale');

  static const $core.List<TransportOperationType> values = <TransportOperationType> [
    purchase,
    write_off,
    sale,
  ];

  static final $core.Map<$core.int, TransportOperationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransportOperationType? valueOf($core.int value) => _byValue[value];

  const TransportOperationType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
