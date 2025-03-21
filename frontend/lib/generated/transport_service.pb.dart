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

import 'google/protobuf/timestamp.pb.dart' as $2;

export 'transport_service.pbenum.dart';

class TransportOperation extends $pb.GeneratedMessage {
  factory TransportOperation({
    $core.int? id,
    $core.String? type,
    $2.Timestamp? date,
    $core.String? description,
    $core.int? transportId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (date != null) {
      $result.date = date;
    }
    if (description != null) {
      $result.description = description;
    }
    if (transportId != null) {
      $result.transportId = transportId;
    }
    return $result;
  }
  TransportOperation._() : super();
  factory TransportOperation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportOperation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportOperation', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'date', subBuilder: $2.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportOperation clone() => TransportOperation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportOperation copyWith(void Function(TransportOperation) updates) => super.copyWith((message) => updates(message as TransportOperation)) as TransportOperation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportOperation create() => TransportOperation._();
  TransportOperation createEmptyInstance() => create();
  static $pb.PbList<TransportOperation> createRepeated() => $pb.PbList<TransportOperation>();
  @$core.pragma('dart2js:noInline')
  static TransportOperation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportOperation>(create);
  static TransportOperation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get date => $_getN(2);
  @$pb.TagNumber(3)
  set date($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get transportId => $_getIZ(4);
  @$pb.TagNumber(5)
  set transportId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransportId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransportId() => clearField(5);
}

class GarageFacility extends $pb.GeneratedMessage {
  factory GarageFacility({
    $core.int? id,
    $core.String? type,
    $core.String? name,
    $core.String? address,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  GarageFacility._() : super();
  factory GarageFacility.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GarageFacility.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GarageFacility', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GarageFacility clone() => GarageFacility()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GarageFacility copyWith(void Function(GarageFacility) updates) => super.copyWith((message) => updates(message as GarageFacility)) as GarageFacility;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GarageFacility create() => GarageFacility._();
  GarageFacility createEmptyInstance() => create();
  static $pb.PbList<GarageFacility> createRepeated() => $pb.PbList<GarageFacility>();
  @$core.pragma('dart2js:noInline')
  static GarageFacility getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GarageFacility>(create);
  static GarageFacility? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);
}

class BusInfo extends $pb.GeneratedMessage {
  factory BusInfo({
    $core.int? passengersNum,
  }) {
    final $result = create();
    if (passengersNum != null) {
      $result.passengersNum = passengersNum;
    }
    return $result;
  }
  BusInfo._() : super();
  factory BusInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'passengersNum', $pb.PbFieldType.O3, protoName: 'passengersNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusInfo clone() => BusInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusInfo copyWith(void Function(BusInfo) updates) => super.copyWith((message) => updates(message as BusInfo)) as BusInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusInfo create() => BusInfo._();
  BusInfo createEmptyInstance() => create();
  static $pb.PbList<BusInfo> createRepeated() => $pb.PbList<BusInfo>();
  @$core.pragma('dart2js:noInline')
  static BusInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusInfo>(create);
  static BusInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get passengersNum => $_getIZ(0);
  @$pb.TagNumber(2)
  set passengersNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassengersNum() => $_has(0);
  @$pb.TagNumber(2)
  void clearPassengersNum() => clearField(2);
}

class TaxiInfo extends $pb.GeneratedMessage {
  factory TaxiInfo({
    $core.bool? isAvailable,
    $core.int? yearsOfManufacture,
    $core.String? fuelType,
  }) {
    final $result = create();
    if (isAvailable != null) {
      $result.isAvailable = isAvailable;
    }
    if (yearsOfManufacture != null) {
      $result.yearsOfManufacture = yearsOfManufacture;
    }
    if (fuelType != null) {
      $result.fuelType = fuelType;
    }
    return $result;
  }
  TaxiInfo._() : super();
  factory TaxiInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaxiInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaxiInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable', protoName: 'isAvailable')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'yearsOfManufacture', $pb.PbFieldType.O3, protoName: 'yearsOfManufacture')
    ..aOS(3, _omitFieldNames ? '' : 'fuelType', protoName: 'fuelType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaxiInfo clone() => TaxiInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaxiInfo copyWith(void Function(TaxiInfo) updates) => super.copyWith((message) => updates(message as TaxiInfo)) as TaxiInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaxiInfo create() => TaxiInfo._();
  TaxiInfo createEmptyInstance() => create();
  static $pb.PbList<TaxiInfo> createRepeated() => $pb.PbList<TaxiInfo>();
  @$core.pragma('dart2js:noInline')
  static TaxiInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaxiInfo>(create);
  static TaxiInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get yearsOfManufacture => $_getIZ(1);
  @$pb.TagNumber(2)
  set yearsOfManufacture($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasYearsOfManufacture() => $_has(1);
  @$pb.TagNumber(2)
  void clearYearsOfManufacture() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fuelType => $_getSZ(2);
  @$pb.TagNumber(3)
  set fuelType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFuelType() => $_has(2);
  @$pb.TagNumber(3)
  void clearFuelType() => clearField(3);
}

class TramInfo extends $pb.GeneratedMessage {
  factory TramInfo({
    $core.int? passengersNum,
    $core.int? yearsOfManufacture,
    $core.bool? isOperational,
  }) {
    final $result = create();
    if (passengersNum != null) {
      $result.passengersNum = passengersNum;
    }
    if (yearsOfManufacture != null) {
      $result.yearsOfManufacture = yearsOfManufacture;
    }
    if (isOperational != null) {
      $result.isOperational = isOperational;
    }
    return $result;
  }
  TramInfo._() : super();
  factory TramInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TramInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TramInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'passengersNum', $pb.PbFieldType.O3, protoName: 'passengersNum')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'yearsOfManufacture', $pb.PbFieldType.O3, protoName: 'yearsOfManufacture')
    ..aOB(4, _omitFieldNames ? '' : 'isOperational', protoName: 'isOperational')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TramInfo clone() => TramInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TramInfo copyWith(void Function(TramInfo) updates) => super.copyWith((message) => updates(message as TramInfo)) as TramInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TramInfo create() => TramInfo._();
  TramInfo createEmptyInstance() => create();
  static $pb.PbList<TramInfo> createRepeated() => $pb.PbList<TramInfo>();
  @$core.pragma('dart2js:noInline')
  static TramInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TramInfo>(create);
  static TramInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get passengersNum => $_getIZ(0);
  @$pb.TagNumber(2)
  set passengersNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassengersNum() => $_has(0);
  @$pb.TagNumber(2)
  void clearPassengersNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get yearsOfManufacture => $_getIZ(1);
  @$pb.TagNumber(3)
  set yearsOfManufacture($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasYearsOfManufacture() => $_has(1);
  @$pb.TagNumber(3)
  void clearYearsOfManufacture() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isOperational => $_getBF(2);
  @$pb.TagNumber(4)
  set isOperational($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsOperational() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsOperational() => clearField(4);
}

class TrolleybusInfo extends $pb.GeneratedMessage {
  factory TrolleybusInfo({
    $core.int? passengersNum,
    $core.int? yearsOfManufacture,
    $core.bool? isOperational,
  }) {
    final $result = create();
    if (passengersNum != null) {
      $result.passengersNum = passengersNum;
    }
    if (yearsOfManufacture != null) {
      $result.yearsOfManufacture = yearsOfManufacture;
    }
    if (isOperational != null) {
      $result.isOperational = isOperational;
    }
    return $result;
  }
  TrolleybusInfo._() : super();
  factory TrolleybusInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrolleybusInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrolleybusInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'passengersNum', $pb.PbFieldType.O3, protoName: 'passengersNum')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'yearsOfManufacture', $pb.PbFieldType.O3, protoName: 'yearsOfManufacture')
    ..aOB(4, _omitFieldNames ? '' : 'isOperational', protoName: 'isOperational')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrolleybusInfo clone() => TrolleybusInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrolleybusInfo copyWith(void Function(TrolleybusInfo) updates) => super.copyWith((message) => updates(message as TrolleybusInfo)) as TrolleybusInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrolleybusInfo create() => TrolleybusInfo._();
  TrolleybusInfo createEmptyInstance() => create();
  static $pb.PbList<TrolleybusInfo> createRepeated() => $pb.PbList<TrolleybusInfo>();
  @$core.pragma('dart2js:noInline')
  static TrolleybusInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrolleybusInfo>(create);
  static TrolleybusInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get passengersNum => $_getIZ(0);
  @$pb.TagNumber(2)
  set passengersNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassengersNum() => $_has(0);
  @$pb.TagNumber(2)
  void clearPassengersNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get yearsOfManufacture => $_getIZ(1);
  @$pb.TagNumber(3)
  set yearsOfManufacture($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasYearsOfManufacture() => $_has(1);
  @$pb.TagNumber(3)
  void clearYearsOfManufacture() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isOperational => $_getBF(2);
  @$pb.TagNumber(4)
  set isOperational($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsOperational() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsOperational() => clearField(4);
}

class TruckInfo extends $pb.GeneratedMessage {
  factory TruckInfo({
    $core.double? cargoCapacityKg,
    $core.double? fuelConsumption,
    $core.String? truckType,
    $core.int? yearsOfManufacture,
  }) {
    final $result = create();
    if (cargoCapacityKg != null) {
      $result.cargoCapacityKg = cargoCapacityKg;
    }
    if (fuelConsumption != null) {
      $result.fuelConsumption = fuelConsumption;
    }
    if (truckType != null) {
      $result.truckType = truckType;
    }
    if (yearsOfManufacture != null) {
      $result.yearsOfManufacture = yearsOfManufacture;
    }
    return $result;
  }
  TruckInfo._() : super();
  factory TruckInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TruckInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TruckInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'cargoCapacityKg', $pb.PbFieldType.OF, protoName: 'cargoCapacityKg')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'fuelConsumption', $pb.PbFieldType.OF, protoName: 'fuelConsumption')
    ..aOS(4, _omitFieldNames ? '' : 'truckType', protoName: 'truckType')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'yearsOfManufacture', $pb.PbFieldType.O3, protoName: 'yearsOfManufacture')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TruckInfo clone() => TruckInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TruckInfo copyWith(void Function(TruckInfo) updates) => super.copyWith((message) => updates(message as TruckInfo)) as TruckInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TruckInfo create() => TruckInfo._();
  TruckInfo createEmptyInstance() => create();
  static $pb.PbList<TruckInfo> createRepeated() => $pb.PbList<TruckInfo>();
  @$core.pragma('dart2js:noInline')
  static TruckInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TruckInfo>(create);
  static TruckInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.double get cargoCapacityKg => $_getN(0);
  @$pb.TagNumber(2)
  set cargoCapacityKg($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasCargoCapacityKg() => $_has(0);
  @$pb.TagNumber(2)
  void clearCargoCapacityKg() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get fuelConsumption => $_getN(1);
  @$pb.TagNumber(3)
  set fuelConsumption($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasFuelConsumption() => $_has(1);
  @$pb.TagNumber(3)
  void clearFuelConsumption() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get truckType => $_getSZ(2);
  @$pb.TagNumber(4)
  set truckType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasTruckType() => $_has(2);
  @$pb.TagNumber(4)
  void clearTruckType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get yearsOfManufacture => $_getIZ(3);
  @$pb.TagNumber(5)
  set yearsOfManufacture($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasYearsOfManufacture() => $_has(3);
  @$pb.TagNumber(5)
  void clearYearsOfManufacture() => clearField(5);
}

enum Transport_TransportInfo {
  tramInfo, 
  trolleybusInfo, 
  truckInfo, 
  busInfo, 
  taxiInfo, 
  notSet
}

class Transport extends $pb.GeneratedMessage {
  factory Transport({
    $core.int? id,
    $core.String? type,
    $core.String? brand,
    $core.int? garageFacilityId,
    $core.String? licensePlate,
    $core.String? name,
    TramInfo? tramInfo,
    TrolleybusInfo? trolleybusInfo,
    TruckInfo? truckInfo,
    BusInfo? busInfo,
    TaxiInfo? taxiInfo,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (brand != null) {
      $result.brand = brand;
    }
    if (garageFacilityId != null) {
      $result.garageFacilityId = garageFacilityId;
    }
    if (licensePlate != null) {
      $result.licensePlate = licensePlate;
    }
    if (name != null) {
      $result.name = name;
    }
    if (tramInfo != null) {
      $result.tramInfo = tramInfo;
    }
    if (trolleybusInfo != null) {
      $result.trolleybusInfo = trolleybusInfo;
    }
    if (truckInfo != null) {
      $result.truckInfo = truckInfo;
    }
    if (busInfo != null) {
      $result.busInfo = busInfo;
    }
    if (taxiInfo != null) {
      $result.taxiInfo = taxiInfo;
    }
    return $result;
  }
  Transport._() : super();
  factory Transport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Transport_TransportInfo> _Transport_TransportInfoByTag = {
    7 : Transport_TransportInfo.tramInfo,
    8 : Transport_TransportInfo.trolleybusInfo,
    9 : Transport_TransportInfo.truckInfo,
    10 : Transport_TransportInfo.busInfo,
    11 : Transport_TransportInfo.taxiInfo,
    0 : Transport_TransportInfo.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transport', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..oo(0, [7, 8, 9, 10, 11])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'brand')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'garageFacilityId', $pb.PbFieldType.O3, protoName: 'garageFacilityId')
    ..aOS(5, _omitFieldNames ? '' : 'licensePlate', protoName: 'licensePlate')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOM<TramInfo>(7, _omitFieldNames ? '' : 'tramInfo', protoName: 'tramInfo', subBuilder: TramInfo.create)
    ..aOM<TrolleybusInfo>(8, _omitFieldNames ? '' : 'trolleybusInfo', protoName: 'trolleybusInfo', subBuilder: TrolleybusInfo.create)
    ..aOM<TruckInfo>(9, _omitFieldNames ? '' : 'truckInfo', protoName: 'truckInfo', subBuilder: TruckInfo.create)
    ..aOM<BusInfo>(10, _omitFieldNames ? '' : 'busInfo', protoName: 'busInfo', subBuilder: BusInfo.create)
    ..aOM<TaxiInfo>(11, _omitFieldNames ? '' : 'taxiInfo', protoName: 'taxiInfo', subBuilder: TaxiInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transport clone() => Transport()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transport copyWith(void Function(Transport) updates) => super.copyWith((message) => updates(message as Transport)) as Transport;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transport create() => Transport._();
  Transport createEmptyInstance() => create();
  static $pb.PbList<Transport> createRepeated() => $pb.PbList<Transport>();
  @$core.pragma('dart2js:noInline')
  static Transport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transport>(create);
  static Transport? _defaultInstance;

  Transport_TransportInfo whichTransportInfo() => _Transport_TransportInfoByTag[$_whichOneof(0)]!;
  void clearTransportInfo() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get brand => $_getSZ(2);
  @$pb.TagNumber(3)
  set brand($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrand() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrand() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get garageFacilityId => $_getIZ(3);
  @$pb.TagNumber(4)
  set garageFacilityId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGarageFacilityId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGarageFacilityId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get licensePlate => $_getSZ(4);
  @$pb.TagNumber(5)
  set licensePlate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLicensePlate() => $_has(4);
  @$pb.TagNumber(5)
  void clearLicensePlate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  TramInfo get tramInfo => $_getN(6);
  @$pb.TagNumber(7)
  set tramInfo(TramInfo v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTramInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearTramInfo() => clearField(7);
  @$pb.TagNumber(7)
  TramInfo ensureTramInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  TrolleybusInfo get trolleybusInfo => $_getN(7);
  @$pb.TagNumber(8)
  set trolleybusInfo(TrolleybusInfo v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrolleybusInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrolleybusInfo() => clearField(8);
  @$pb.TagNumber(8)
  TrolleybusInfo ensureTrolleybusInfo() => $_ensure(7);

  @$pb.TagNumber(9)
  TruckInfo get truckInfo => $_getN(8);
  @$pb.TagNumber(9)
  set truckInfo(TruckInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTruckInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearTruckInfo() => clearField(9);
  @$pb.TagNumber(9)
  TruckInfo ensureTruckInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  BusInfo get busInfo => $_getN(9);
  @$pb.TagNumber(10)
  set busInfo(BusInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasBusInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearBusInfo() => clearField(10);
  @$pb.TagNumber(10)
  BusInfo ensureBusInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  TaxiInfo get taxiInfo => $_getN(10);
  @$pb.TagNumber(11)
  set taxiInfo(TaxiInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasTaxiInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearTaxiInfo() => clearField(11);
  @$pb.TagNumber(11)
  TaxiInfo ensureTaxiInfo() => $_ensure(10);
}

class TransportList extends $pb.GeneratedMessage {
  factory TransportList({
    $core.Iterable<Transport>? transports,
  }) {
    final $result = create();
    if (transports != null) {
      $result.transports.addAll(transports);
    }
    return $result;
  }
  TransportList._() : super();
  factory TransportList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Transport>(1, _omitFieldNames ? '' : 'transports', $pb.PbFieldType.PM, subBuilder: Transport.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportList clone() => TransportList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportList copyWith(void Function(TransportList) updates) => super.copyWith((message) => updates(message as TransportList)) as TransportList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportList create() => TransportList._();
  TransportList createEmptyInstance() => create();
  static $pb.PbList<TransportList> createRepeated() => $pb.PbList<TransportList>();
  @$core.pragma('dart2js:noInline')
  static TransportList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportList>(create);
  static TransportList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transport> get transports => $_getList(0);
}

class GarageFacilityList extends $pb.GeneratedMessage {
  factory GarageFacilityList({
    $core.Iterable<GarageFacility>? garages,
  }) {
    final $result = create();
    if (garages != null) {
      $result.garages.addAll(garages);
    }
    return $result;
  }
  GarageFacilityList._() : super();
  factory GarageFacilityList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GarageFacilityList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GarageFacilityList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<GarageFacility>(1, _omitFieldNames ? '' : 'garages', $pb.PbFieldType.PM, subBuilder: GarageFacility.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GarageFacilityList clone() => GarageFacilityList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GarageFacilityList copyWith(void Function(GarageFacilityList) updates) => super.copyWith((message) => updates(message as GarageFacilityList)) as GarageFacilityList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GarageFacilityList create() => GarageFacilityList._();
  GarageFacilityList createEmptyInstance() => create();
  static $pb.PbList<GarageFacilityList> createRepeated() => $pb.PbList<GarageFacilityList>();
  @$core.pragma('dart2js:noInline')
  static GarageFacilityList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GarageFacilityList>(create);
  static GarageFacilityList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GarageFacility> get garages => $_getList(0);
}

class TransportOperationList extends $pb.GeneratedMessage {
  factory TransportOperationList({
    $core.Iterable<TransportOperation>? operations,
  }) {
    final $result = create();
    if (operations != null) {
      $result.operations.addAll(operations);
    }
    return $result;
  }
  TransportOperationList._() : super();
  factory TransportOperationList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportOperationList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportOperationList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<TransportOperation>(1, _omitFieldNames ? '' : 'operations', $pb.PbFieldType.PM, subBuilder: TransportOperation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportOperationList clone() => TransportOperationList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportOperationList copyWith(void Function(TransportOperationList) updates) => super.copyWith((message) => updates(message as TransportOperationList)) as TransportOperationList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportOperationList create() => TransportOperationList._();
  TransportOperationList createEmptyInstance() => create();
  static $pb.PbList<TransportOperationList> createRepeated() => $pb.PbList<TransportOperationList>();
  @$core.pragma('dart2js:noInline')
  static TransportOperationList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportOperationList>(create);
  static TransportOperationList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransportOperation> get operations => $_getList(0);
}

class TransportFilter extends $pb.GeneratedMessage {
  factory TransportFilter({
    $core.int? routeId,
    $core.int? garageFacilityId,
    $core.Iterable<$core.int>? ids,
  }) {
    final $result = create();
    if (routeId != null) {
      $result.routeId = routeId;
    }
    if (garageFacilityId != null) {
      $result.garageFacilityId = garageFacilityId;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  TransportFilter._() : super();
  factory TransportFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'routeId', $pb.PbFieldType.O3, protoName: 'routeId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'garageFacilityId', $pb.PbFieldType.O3, protoName: 'garageFacilityId')
    ..p<$core.int>(3, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportFilter clone() => TransportFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportFilter copyWith(void Function(TransportFilter) updates) => super.copyWith((message) => updates(message as TransportFilter)) as TransportFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportFilter create() => TransportFilter._();
  TransportFilter createEmptyInstance() => create();
  static $pb.PbList<TransportFilter> createRepeated() => $pb.PbList<TransportFilter>();
  @$core.pragma('dart2js:noInline')
  static TransportFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportFilter>(create);
  static TransportFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get routeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set routeId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRouteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRouteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get garageFacilityId => $_getIZ(1);
  @$pb.TagNumber(2)
  set garageFacilityId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGarageFacilityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGarageFacilityId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ids => $_getList(2);
}

class ModifyRouteRequest extends $pb.GeneratedMessage {
  factory ModifyRouteRequest({
    $core.int? id,
    $core.Iterable<$core.int>? transportId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (transportId != null) {
      $result.transportId.addAll(transportId);
    }
    return $result;
  }
  ModifyRouteRequest._() : super();
  factory ModifyRouteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModifyRouteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ModifyRouteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.K3, protoName: 'transportId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModifyRouteRequest clone() => ModifyRouteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModifyRouteRequest copyWith(void Function(ModifyRouteRequest) updates) => super.copyWith((message) => updates(message as ModifyRouteRequest)) as ModifyRouteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModifyRouteRequest create() => ModifyRouteRequest._();
  ModifyRouteRequest createEmptyInstance() => create();
  static $pb.PbList<ModifyRouteRequest> createRepeated() => $pb.PbList<ModifyRouteRequest>();
  @$core.pragma('dart2js:noInline')
  static ModifyRouteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModifyRouteRequest>(create);
  static ModifyRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get transportId => $_getList(1);
}

class Route extends $pb.GeneratedMessage {
  factory Route({
    $core.int? id,
    $core.String? name,
    $core.Iterable<Transport>? transport,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (transport != null) {
      $result.transport.addAll(transport);
    }
    return $result;
  }
  Route._() : super();
  factory Route.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Route.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Route', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Transport>(3, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.PM, subBuilder: Transport.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Route clone() => Route()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Route copyWith(void Function(Route) updates) => super.copyWith((message) => updates(message as Route)) as Route;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Route create() => Route._();
  Route createEmptyInstance() => create();
  static $pb.PbList<Route> createRepeated() => $pb.PbList<Route>();
  @$core.pragma('dart2js:noInline')
  static Route getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Route>(create);
  static Route? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Transport> get transport => $_getList(2);
}

class RouteList extends $pb.GeneratedMessage {
  factory RouteList({
    $core.Iterable<Route>? routes,
  }) {
    final $result = create();
    if (routes != null) {
      $result.routes.addAll(routes);
    }
    return $result;
  }
  RouteList._() : super();
  factory RouteList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RouteList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RouteList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Route>(1, _omitFieldNames ? '' : 'routes', $pb.PbFieldType.PM, subBuilder: Route.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RouteList clone() => RouteList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RouteList copyWith(void Function(RouteList) updates) => super.copyWith((message) => updates(message as RouteList)) as RouteList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RouteList create() => RouteList._();
  RouteList createEmptyInstance() => create();
  static $pb.PbList<RouteList> createRepeated() => $pb.PbList<RouteList>();
  @$core.pragma('dart2js:noInline')
  static RouteList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RouteList>(create);
  static RouteList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Route> get routes => $_getList(0);
}

class GetRouteByTransportIdRequest extends $pb.GeneratedMessage {
  factory GetRouteByTransportIdRequest({
    $core.int? transportId,
  }) {
    final $result = create();
    if (transportId != null) {
      $result.transportId = transportId;
    }
    return $result;
  }
  GetRouteByTransportIdRequest._() : super();
  factory GetRouteByTransportIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRouteByTransportIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRouteByTransportIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRouteByTransportIdRequest clone() => GetRouteByTransportIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRouteByTransportIdRequest copyWith(void Function(GetRouteByTransportIdRequest) updates) => super.copyWith((message) => updates(message as GetRouteByTransportIdRequest)) as GetRouteByTransportIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRouteByTransportIdRequest create() => GetRouteByTransportIdRequest._();
  GetRouteByTransportIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetRouteByTransportIdRequest> createRepeated() => $pb.PbList<GetRouteByTransportIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRouteByTransportIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRouteByTransportIdRequest>(create);
  static GetRouteByTransportIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get transportId => $_getIZ(0);
  @$pb.TagNumber(1)
  set transportId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransportId() => clearField(1);
}

class OperationFilter extends $pb.GeneratedMessage {
  factory OperationFilter({
    $2.Timestamp? dateFrom,
    $2.Timestamp? dateTo,
    $core.Iterable<$core.int>? ids,
  }) {
    final $result = create();
    if (dateFrom != null) {
      $result.dateFrom = dateFrom;
    }
    if (dateTo != null) {
      $result.dateTo = dateTo;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  OperationFilter._() : super();
  factory OperationFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OperationFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'dateFrom', protoName: 'dateFrom', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'dateTo', protoName: 'dateTo', subBuilder: $2.Timestamp.create)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperationFilter clone() => OperationFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperationFilter copyWith(void Function(OperationFilter) updates) => super.copyWith((message) => updates(message as OperationFilter)) as OperationFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationFilter create() => OperationFilter._();
  OperationFilter createEmptyInstance() => create();
  static $pb.PbList<OperationFilter> createRepeated() => $pb.PbList<OperationFilter>();
  @$core.pragma('dart2js:noInline')
  static OperationFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationFilter>(create);
  static OperationFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get dateFrom => $_getN(0);
  @$pb.TagNumber(1)
  set dateFrom($2.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDateFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDateFrom() => clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureDateFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Timestamp get dateTo => $_getN(1);
  @$pb.TagNumber(2)
  set dateTo($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDateTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateTo() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureDateTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ids => $_getList(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
