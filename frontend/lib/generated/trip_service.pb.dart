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

import 'google/protobuf/timestamp.pb.dart' as $2;

export 'trip_service.pbenum.dart';

class TripInfoCargo extends $pb.GeneratedMessage {
  factory TripInfoCargo({
    $core.int? id,
    $core.String? cargoType,
    $core.String? cargoName,
    $core.double? cargoWeight,
    $core.double? cargoCost,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (cargoType != null) {
      $result.cargoType = cargoType;
    }
    if (cargoName != null) {
      $result.cargoName = cargoName;
    }
    if (cargoWeight != null) {
      $result.cargoWeight = cargoWeight;
    }
    if (cargoCost != null) {
      $result.cargoCost = cargoCost;
    }
    return $result;
  }
  TripInfoCargo._() : super();
  factory TripInfoCargo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripInfoCargo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TripInfoCargo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'cargoType', protoName: 'cargoType')
    ..aOS(3, _omitFieldNames ? '' : 'cargoName', protoName: 'cargoName')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'cargoWeight', $pb.PbFieldType.OF, protoName: 'cargoWeight')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'cargoCost', $pb.PbFieldType.OF, protoName: 'cargoCost')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripInfoCargo clone() => TripInfoCargo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripInfoCargo copyWith(void Function(TripInfoCargo) updates) => super.copyWith((message) => updates(message as TripInfoCargo)) as TripInfoCargo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TripInfoCargo create() => TripInfoCargo._();
  TripInfoCargo createEmptyInstance() => create();
  static $pb.PbList<TripInfoCargo> createRepeated() => $pb.PbList<TripInfoCargo>();
  @$core.pragma('dart2js:noInline')
  static TripInfoCargo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripInfoCargo>(create);
  static TripInfoCargo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cargoType => $_getSZ(1);
  @$pb.TagNumber(2)
  set cargoType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCargoType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCargoType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cargoName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cargoName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCargoName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCargoName() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get cargoWeight => $_getN(3);
  @$pb.TagNumber(4)
  set cargoWeight($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCargoWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearCargoWeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get cargoCost => $_getN(4);
  @$pb.TagNumber(5)
  set cargoCost($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCargoCost() => $_has(4);
  @$pb.TagNumber(5)
  void clearCargoCost() => clearField(5);
}

class TripInfoPassenger extends $pb.GeneratedMessage {
  factory TripInfoPassenger({
    $core.int? id,
    $core.int? passengersNum,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (passengersNum != null) {
      $result.passengersNum = passengersNum;
    }
    return $result;
  }
  TripInfoPassenger._() : super();
  factory TripInfoPassenger.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripInfoPassenger.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TripInfoPassenger', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'passengersNum', $pb.PbFieldType.O3, protoName: 'passengersNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripInfoPassenger clone() => TripInfoPassenger()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripInfoPassenger copyWith(void Function(TripInfoPassenger) updates) => super.copyWith((message) => updates(message as TripInfoPassenger)) as TripInfoPassenger;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TripInfoPassenger create() => TripInfoPassenger._();
  TripInfoPassenger createEmptyInstance() => create();
  static $pb.PbList<TripInfoPassenger> createRepeated() => $pb.PbList<TripInfoPassenger>();
  @$core.pragma('dart2js:noInline')
  static TripInfoPassenger getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripInfoPassenger>(create);
  static TripInfoPassenger? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get passengersNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set passengersNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassengersNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassengersNum() => clearField(2);
}

enum Trip_TripInfo {
  cargo, 
  passengers, 
  notSet
}

class Trip extends $pb.GeneratedMessage {
  factory Trip({
    $core.int? id,
    $core.int? routeId,
    $core.int? driverId,
    $core.int? transportId,
    $2.Timestamp? startTime,
    $2.Timestamp? endTime,
    $core.String? type,
    TripInfoCargo? cargo,
    TripInfoPassenger? passengers,
    $core.double? distance,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (routeId != null) {
      $result.routeId = routeId;
    }
    if (driverId != null) {
      $result.driverId = driverId;
    }
    if (transportId != null) {
      $result.transportId = transportId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (type != null) {
      $result.type = type;
    }
    if (cargo != null) {
      $result.cargo = cargo;
    }
    if (passengers != null) {
      $result.passengers = passengers;
    }
    if (distance != null) {
      $result.distance = distance;
    }
    return $result;
  }
  Trip._() : super();
  factory Trip.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trip.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Trip_TripInfo> _Trip_TripInfoByTag = {
    8 : Trip_TripInfo.cargo,
    9 : Trip_TripInfo.passengers,
    0 : Trip_TripInfo.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Trip', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..oo(0, [8, 9])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'routeId', $pb.PbFieldType.O3, protoName: 'routeId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'driverId', $pb.PbFieldType.O3, protoName: 'driverId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'startTime', protoName: 'startTime', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'endTime', protoName: 'endTime', subBuilder: $2.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'type')
    ..aOM<TripInfoCargo>(8, _omitFieldNames ? '' : 'cargo', subBuilder: TripInfoCargo.create)
    ..aOM<TripInfoPassenger>(9, _omitFieldNames ? '' : 'passengers', subBuilder: TripInfoPassenger.create)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'distance', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Trip clone() => Trip()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Trip copyWith(void Function(Trip) updates) => super.copyWith((message) => updates(message as Trip)) as Trip;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Trip create() => Trip._();
  Trip createEmptyInstance() => create();
  static $pb.PbList<Trip> createRepeated() => $pb.PbList<Trip>();
  @$core.pragma('dart2js:noInline')
  static Trip getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trip>(create);
  static Trip? _defaultInstance;

  Trip_TripInfo whichTripInfo() => _Trip_TripInfoByTag[$_whichOneof(0)]!;
  void clearTripInfo() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get routeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set routeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRouteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRouteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get driverId => $_getIZ(2);
  @$pb.TagNumber(3)
  set driverId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDriverId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDriverId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get transportId => $_getIZ(3);
  @$pb.TagNumber(4)
  set transportId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTransportId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransportId() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get startTime => $_getN(4);
  @$pb.TagNumber(5)
  set startTime($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureStartTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get endTime => $_getN(5);
  @$pb.TagNumber(6)
  set endTime($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureEndTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  TripInfoCargo get cargo => $_getN(7);
  @$pb.TagNumber(8)
  set cargo(TripInfoCargo v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCargo() => $_has(7);
  @$pb.TagNumber(8)
  void clearCargo() => clearField(8);
  @$pb.TagNumber(8)
  TripInfoCargo ensureCargo() => $_ensure(7);

  @$pb.TagNumber(9)
  TripInfoPassenger get passengers => $_getN(8);
  @$pb.TagNumber(9)
  set passengers(TripInfoPassenger v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPassengers() => $_has(8);
  @$pb.TagNumber(9)
  void clearPassengers() => clearField(9);
  @$pb.TagNumber(9)
  TripInfoPassenger ensurePassengers() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.double get distance => $_getN(9);
  @$pb.TagNumber(10)
  set distance($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDistance() => $_has(9);
  @$pb.TagNumber(10)
  void clearDistance() => clearField(10);
}

class TripFilter extends $pb.GeneratedMessage {
  factory TripFilter({
    $core.int? routeId,
    $core.int? driverId,
    $core.int? transportId,
    $2.Timestamp? dateFrom,
    $2.Timestamp? dateTo,
    $core.String? type,
    $core.Iterable<$core.int>? ids,
  }) {
    final $result = create();
    if (routeId != null) {
      $result.routeId = routeId;
    }
    if (driverId != null) {
      $result.driverId = driverId;
    }
    if (transportId != null) {
      $result.transportId = transportId;
    }
    if (dateFrom != null) {
      $result.dateFrom = dateFrom;
    }
    if (dateTo != null) {
      $result.dateTo = dateTo;
    }
    if (type != null) {
      $result.type = type;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  TripFilter._() : super();
  factory TripFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TripFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'routeId', $pb.PbFieldType.O3, protoName: 'routeId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'driverId', $pb.PbFieldType.O3, protoName: 'driverId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'dateFrom', protoName: 'dateFrom', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'dateTo', protoName: 'dateTo', subBuilder: $2.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'type')
    ..p<$core.int>(7, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripFilter clone() => TripFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripFilter copyWith(void Function(TripFilter) updates) => super.copyWith((message) => updates(message as TripFilter)) as TripFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TripFilter create() => TripFilter._();
  TripFilter createEmptyInstance() => create();
  static $pb.PbList<TripFilter> createRepeated() => $pb.PbList<TripFilter>();
  @$core.pragma('dart2js:noInline')
  static TripFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripFilter>(create);
  static TripFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get routeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set routeId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRouteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRouteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get driverId => $_getIZ(1);
  @$pb.TagNumber(2)
  set driverId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDriverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDriverId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get transportId => $_getIZ(2);
  @$pb.TagNumber(3)
  set transportId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransportId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransportId() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get dateFrom => $_getN(3);
  @$pb.TagNumber(4)
  set dateFrom($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateFrom() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDateFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Timestamp get dateTo => $_getN(4);
  @$pb.TagNumber(5)
  set dateTo($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateTo() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureDateTo() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get ids => $_getList(6);
}

class TripList extends $pb.GeneratedMessage {
  factory TripList({
    $core.Iterable<Trip>? trips,
  }) {
    final $result = create();
    if (trips != null) {
      $result.trips.addAll(trips);
    }
    return $result;
  }
  TripList._() : super();
  factory TripList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TripList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Trip>(1, _omitFieldNames ? '' : 'trips', $pb.PbFieldType.PM, subBuilder: Trip.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripList clone() => TripList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripList copyWith(void Function(TripList) updates) => super.copyWith((message) => updates(message as TripList)) as TripList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TripList create() => TripList._();
  TripList createEmptyInstance() => create();
  static $pb.PbList<TripList> createRepeated() => $pb.PbList<TripList>();
  @$core.pragma('dart2js:noInline')
  static TripList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripList>(create);
  static TripList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Trip> get trips => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
