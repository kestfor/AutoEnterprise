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

import 'google/protobuf/timestamp.pb.dart' as $2;
import 'person_service.pbenum.dart';

export 'person_service.pbenum.dart';

class TransportUnit extends $pb.GeneratedMessage {
  factory TransportUnit({
    $core.int? id,
    $core.String? name,
    $core.String? description,
    $core.String? type,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  TransportUnit._() : super();
  factory TransportUnit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportUnit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportUnit', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportUnit clone() => TransportUnit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportUnit copyWith(void Function(TransportUnit) updates) => super.copyWith((message) => updates(message as TransportUnit)) as TransportUnit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportUnit create() => TransportUnit._();
  TransportUnit createEmptyInstance() => create();
  static $pb.PbList<TransportUnit> createRepeated() => $pb.PbList<TransportUnit>();
  @$core.pragma('dart2js:noInline')
  static TransportUnit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportUnit>(create);
  static TransportUnit? _defaultInstance;

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
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class RepairWork extends $pb.GeneratedMessage {
  factory RepairWork({
    $core.int? id,
    $core.String? description,
    $2.Timestamp? startTime,
    $2.Timestamp? endTime,
    $core.int? transportId,
    $core.int? servicePersonnelId,
    $core.int? unitId,
    $core.double? repairCost,
    $core.String? state,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (description != null) {
      $result.description = description;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (transportId != null) {
      $result.transportId = transportId;
    }
    if (servicePersonnelId != null) {
      $result.servicePersonnelId = servicePersonnelId;
    }
    if (unitId != null) {
      $result.unitId = unitId;
    }
    if (repairCost != null) {
      $result.repairCost = repairCost;
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  RepairWork._() : super();
  factory RepairWork.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairWork.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairWork', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'startTime', protoName: 'startTime', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'endTime', protoName: 'endTime', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'servicePersonnelId', $pb.PbFieldType.O3, protoName: 'servicePersonnelId')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'unitId', $pb.PbFieldType.O3, protoName: 'unitId')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'repairCost', $pb.PbFieldType.OF, protoName: 'repairCost')
    ..aOS(9, _omitFieldNames ? '' : 'state')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairWork clone() => RepairWork()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairWork copyWith(void Function(RepairWork) updates) => super.copyWith((message) => updates(message as RepairWork)) as RepairWork;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairWork create() => RepairWork._();
  RepairWork createEmptyInstance() => create();
  static $pb.PbList<RepairWork> createRepeated() => $pb.PbList<RepairWork>();
  @$core.pragma('dart2js:noInline')
  static RepairWork getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairWork>(create);
  static RepairWork? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get startTime => $_getN(2);
  @$pb.TagNumber(3)
  set startTime($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureStartTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get endTime => $_getN(3);
  @$pb.TagNumber(4)
  set endTime($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTime() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureEndTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get transportId => $_getIZ(4);
  @$pb.TagNumber(5)
  set transportId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransportId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransportId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get servicePersonnelId => $_getIZ(5);
  @$pb.TagNumber(6)
  set servicePersonnelId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasServicePersonnelId() => $_has(5);
  @$pb.TagNumber(6)
  void clearServicePersonnelId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get unitId => $_getIZ(6);
  @$pb.TagNumber(7)
  set unitId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnitId() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnitId() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get repairCost => $_getN(7);
  @$pb.TagNumber(8)
  set repairCost($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRepairCost() => $_has(7);
  @$pb.TagNumber(8)
  void clearRepairCost() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get state => $_getSZ(8);
  @$pb.TagNumber(9)
  set state($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasState() => $_has(8);
  @$pb.TagNumber(9)
  void clearState() => clearField(9);
}

class Brigade extends $pb.GeneratedMessage {
  factory Brigade({
    $core.int? id,
    $core.int? foremanId,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (foremanId != null) {
      $result.foremanId = foremanId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Brigade._() : super();
  factory Brigade.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Brigade.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Brigade', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'foremanId', $pb.PbFieldType.O3, protoName: 'foremanId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Brigade clone() => Brigade()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Brigade copyWith(void Function(Brigade) updates) => super.copyWith((message) => updates(message as Brigade)) as Brigade;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Brigade create() => Brigade._();
  Brigade createEmptyInstance() => create();
  static $pb.PbList<Brigade> createRepeated() => $pb.PbList<Brigade>();
  @$core.pragma('dart2js:noInline')
  static Brigade getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Brigade>(create);
  static Brigade? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get foremanId => $_getIZ(1);
  @$pb.TagNumber(2)
  set foremanId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForemanId() => $_has(1);
  @$pb.TagNumber(2)
  void clearForemanId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class DriverInfo extends $pb.GeneratedMessage {
  factory DriverInfo({
    $core.int? transportId,
    $core.int? brigadeId,
  }) {
    final $result = create();
    if (transportId != null) {
      $result.transportId = transportId;
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    return $result;
  }
  DriverInfo._() : super();
  factory DriverInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DriverInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DriverInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DriverInfo clone() => DriverInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DriverInfo copyWith(void Function(DriverInfo) updates) => super.copyWith((message) => updates(message as DriverInfo)) as DriverInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DriverInfo create() => DriverInfo._();
  DriverInfo createEmptyInstance() => create();
  static $pb.PbList<DriverInfo> createRepeated() => $pb.PbList<DriverInfo>();
  @$core.pragma('dart2js:noInline')
  static DriverInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DriverInfo>(create);
  static DriverInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get transportId => $_getIZ(0);
  @$pb.TagNumber(1)
  set transportId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransportId() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get brigadeId => $_getIZ(1);
  @$pb.TagNumber(3)
  set brigadeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrigadeId() => $_has(1);
  @$pb.TagNumber(3)
  void clearBrigadeId() => clearField(3);
}

class ForemanInfo extends $pb.GeneratedMessage {
  factory ForemanInfo({
    $core.int? masterId,
    $core.String? serviceCenter,
    $core.String? certification,
  }) {
    final $result = create();
    if (masterId != null) {
      $result.masterId = masterId;
    }
    if (serviceCenter != null) {
      $result.serviceCenter = serviceCenter;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    return $result;
  }
  ForemanInfo._() : super();
  factory ForemanInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForemanInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForemanInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'masterId', $pb.PbFieldType.O3, protoName: 'masterId')
    ..aOS(3, _omitFieldNames ? '' : 'serviceCenter', protoName: 'serviceCenter')
    ..aOS(4, _omitFieldNames ? '' : 'certification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForemanInfo clone() => ForemanInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForemanInfo copyWith(void Function(ForemanInfo) updates) => super.copyWith((message) => updates(message as ForemanInfo)) as ForemanInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForemanInfo create() => ForemanInfo._();
  ForemanInfo createEmptyInstance() => create();
  static $pb.PbList<ForemanInfo> createRepeated() => $pb.PbList<ForemanInfo>();
  @$core.pragma('dart2js:noInline')
  static ForemanInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForemanInfo>(create);
  static ForemanInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get masterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set masterId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMasterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMasterId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get serviceCenter => $_getSZ(1);
  @$pb.TagNumber(3)
  set serviceCenter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceCenter() => $_has(1);
  @$pb.TagNumber(3)
  void clearServiceCenter() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get certification => $_getSZ(2);
  @$pb.TagNumber(4)
  set certification($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasCertification() => $_has(2);
  @$pb.TagNumber(4)
  void clearCertification() => clearField(4);
}

class MasterInfo extends $pb.GeneratedMessage {
  factory MasterInfo({
    $core.int? managerId,
  }) {
    final $result = create();
    if (managerId != null) {
      $result.managerId = managerId;
    }
    return $result;
  }
  MasterInfo._() : super();
  factory MasterInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MasterInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MasterInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'managerId', $pb.PbFieldType.O3, protoName: 'managerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MasterInfo clone() => MasterInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MasterInfo copyWith(void Function(MasterInfo) updates) => super.copyWith((message) => updates(message as MasterInfo)) as MasterInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MasterInfo create() => MasterInfo._();
  MasterInfo createEmptyInstance() => create();
  static $pb.PbList<MasterInfo> createRepeated() => $pb.PbList<MasterInfo>();
  @$core.pragma('dart2js:noInline')
  static MasterInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MasterInfo>(create);
  static MasterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get managerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set managerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasManagerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearManagerId() => clearField(1);
}

class ManagerInfo extends $pb.GeneratedMessage {
  factory ManagerInfo({
    $core.String? department,
    $core.int? managementExperienceYears,
  }) {
    final $result = create();
    if (department != null) {
      $result.department = department;
    }
    if (managementExperienceYears != null) {
      $result.managementExperienceYears = managementExperienceYears;
    }
    return $result;
  }
  ManagerInfo._() : super();
  factory ManagerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManagerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ManagerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'department')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'managementExperienceYears', $pb.PbFieldType.O3, protoName: 'managementExperienceYears')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ManagerInfo clone() => ManagerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ManagerInfo copyWith(void Function(ManagerInfo) updates) => super.copyWith((message) => updates(message as ManagerInfo)) as ManagerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManagerInfo create() => ManagerInfo._();
  ManagerInfo createEmptyInstance() => create();
  static $pb.PbList<ManagerInfo> createRepeated() => $pb.PbList<ManagerInfo>();
  @$core.pragma('dart2js:noInline')
  static ManagerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManagerInfo>(create);
  static ManagerInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get department => $_getSZ(0);
  @$pb.TagNumber(2)
  set department($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepartment() => $_has(0);
  @$pb.TagNumber(2)
  void clearDepartment() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get managementExperienceYears => $_getIZ(1);
  @$pb.TagNumber(3)
  set managementExperienceYears($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagementExperienceYears() => $_has(1);
  @$pb.TagNumber(3)
  void clearManagementExperienceYears() => clearField(3);
}

class AssemblerInfo extends $pb.GeneratedMessage {
  factory AssemblerInfo({
    $core.int? experienceYears,
    $core.String? specialization,
    $core.String? certification,
    $core.int? brigadeId,
  }) {
    final $result = create();
    if (experienceYears != null) {
      $result.experienceYears = experienceYears;
    }
    if (specialization != null) {
      $result.specialization = specialization;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    return $result;
  }
  AssemblerInfo._() : super();
  factory AssemblerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssemblerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssemblerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'experienceYears', $pb.PbFieldType.O3, protoName: 'experienceYears')
    ..aOS(3, _omitFieldNames ? '' : 'specialization')
    ..aOS(4, _omitFieldNames ? '' : 'certification')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssemblerInfo clone() => AssemblerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssemblerInfo copyWith(void Function(AssemblerInfo) updates) => super.copyWith((message) => updates(message as AssemblerInfo)) as AssemblerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssemblerInfo create() => AssemblerInfo._();
  AssemblerInfo createEmptyInstance() => create();
  static $pb.PbList<AssemblerInfo> createRepeated() => $pb.PbList<AssemblerInfo>();
  @$core.pragma('dart2js:noInline')
  static AssemblerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssemblerInfo>(create);
  static AssemblerInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get experienceYears => $_getIZ(0);
  @$pb.TagNumber(2)
  set experienceYears($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasExperienceYears() => $_has(0);
  @$pb.TagNumber(2)
  void clearExperienceYears() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get specialization => $_getSZ(1);
  @$pb.TagNumber(3)
  set specialization($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSpecialization() => $_has(1);
  @$pb.TagNumber(3)
  void clearSpecialization() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get certification => $_getSZ(2);
  @$pb.TagNumber(4)
  set certification($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasCertification() => $_has(2);
  @$pb.TagNumber(4)
  void clearCertification() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get brigadeId => $_getIZ(3);
  @$pb.TagNumber(5)
  set brigadeId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrigadeId() => $_has(3);
  @$pb.TagNumber(5)
  void clearBrigadeId() => clearField(5);
}

class PlumberInfo extends $pb.GeneratedMessage {
  factory PlumberInfo({
    $core.String? specialization,
    $core.String? certification,
    $core.bool? safetyTraining,
    $core.int? brigadeId,
  }) {
    final $result = create();
    if (specialization != null) {
      $result.specialization = specialization;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (safetyTraining != null) {
      $result.safetyTraining = safetyTraining;
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    return $result;
  }
  PlumberInfo._() : super();
  factory PlumberInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlumberInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlumberInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'specialization')
    ..aOS(3, _omitFieldNames ? '' : 'certification')
    ..aOB(4, _omitFieldNames ? '' : 'safetyTraining', protoName: 'safetyTraining')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlumberInfo clone() => PlumberInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlumberInfo copyWith(void Function(PlumberInfo) updates) => super.copyWith((message) => updates(message as PlumberInfo)) as PlumberInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlumberInfo create() => PlumberInfo._();
  PlumberInfo createEmptyInstance() => create();
  static $pb.PbList<PlumberInfo> createRepeated() => $pb.PbList<PlumberInfo>();
  @$core.pragma('dart2js:noInline')
  static PlumberInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlumberInfo>(create);
  static PlumberInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get specialization => $_getSZ(0);
  @$pb.TagNumber(2)
  set specialization($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpecialization() => $_has(0);
  @$pb.TagNumber(2)
  void clearSpecialization() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get certification => $_getSZ(1);
  @$pb.TagNumber(3)
  set certification($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCertification() => $_has(1);
  @$pb.TagNumber(3)
  void clearCertification() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get safetyTraining => $_getBF(2);
  @$pb.TagNumber(4)
  set safetyTraining($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSafetyTraining() => $_has(2);
  @$pb.TagNumber(4)
  void clearSafetyTraining() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get brigadeId => $_getIZ(3);
  @$pb.TagNumber(5)
  set brigadeId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrigadeId() => $_has(3);
  @$pb.TagNumber(5)
  void clearBrigadeId() => clearField(5);
}

class TechnicianInfo extends $pb.GeneratedMessage {
  factory TechnicianInfo({
    $core.String? fieldOfExpertise,
    $core.String? certification,
    $core.int? brigadeId,
  }) {
    final $result = create();
    if (fieldOfExpertise != null) {
      $result.fieldOfExpertise = fieldOfExpertise;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    return $result;
  }
  TechnicianInfo._() : super();
  factory TechnicianInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TechnicianInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TechnicianInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'fieldOfExpertise', protoName: 'fieldOfExpertise')
    ..aOS(3, _omitFieldNames ? '' : 'certification')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TechnicianInfo clone() => TechnicianInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TechnicianInfo copyWith(void Function(TechnicianInfo) updates) => super.copyWith((message) => updates(message as TechnicianInfo)) as TechnicianInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TechnicianInfo create() => TechnicianInfo._();
  TechnicianInfo createEmptyInstance() => create();
  static $pb.PbList<TechnicianInfo> createRepeated() => $pb.PbList<TechnicianInfo>();
  @$core.pragma('dart2js:noInline')
  static TechnicianInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TechnicianInfo>(create);
  static TechnicianInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get fieldOfExpertise => $_getSZ(0);
  @$pb.TagNumber(2)
  set fieldOfExpertise($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldOfExpertise() => $_has(0);
  @$pb.TagNumber(2)
  void clearFieldOfExpertise() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get certification => $_getSZ(1);
  @$pb.TagNumber(3)
  set certification($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCertification() => $_has(1);
  @$pb.TagNumber(3)
  void clearCertification() => clearField(3);

  @$pb.TagNumber(5)
  $core.int get brigadeId => $_getIZ(2);
  @$pb.TagNumber(5)
  set brigadeId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrigadeId() => $_has(2);
  @$pb.TagNumber(5)
  void clearBrigadeId() => clearField(5);
}

class WelderInfo extends $pb.GeneratedMessage {
  factory WelderInfo({
    $core.String? weldingType,
    $core.String? certification,
    $core.bool? safetyTraining,
    $core.int? brigadeId,
  }) {
    final $result = create();
    if (weldingType != null) {
      $result.weldingType = weldingType;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (safetyTraining != null) {
      $result.safetyTraining = safetyTraining;
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    return $result;
  }
  WelderInfo._() : super();
  factory WelderInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WelderInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WelderInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'weldingType', protoName: 'weldingType')
    ..aOS(3, _omitFieldNames ? '' : 'certification')
    ..aOB(4, _omitFieldNames ? '' : 'safetyTraining', protoName: 'safetyTraining')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WelderInfo clone() => WelderInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WelderInfo copyWith(void Function(WelderInfo) updates) => super.copyWith((message) => updates(message as WelderInfo)) as WelderInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WelderInfo create() => WelderInfo._();
  WelderInfo createEmptyInstance() => create();
  static $pb.PbList<WelderInfo> createRepeated() => $pb.PbList<WelderInfo>();
  @$core.pragma('dart2js:noInline')
  static WelderInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WelderInfo>(create);
  static WelderInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get weldingType => $_getSZ(0);
  @$pb.TagNumber(2)
  set weldingType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasWeldingType() => $_has(0);
  @$pb.TagNumber(2)
  void clearWeldingType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get certification => $_getSZ(1);
  @$pb.TagNumber(3)
  set certification($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCertification() => $_has(1);
  @$pb.TagNumber(3)
  void clearCertification() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get safetyTraining => $_getBF(2);
  @$pb.TagNumber(4)
  set safetyTraining($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSafetyTraining() => $_has(2);
  @$pb.TagNumber(4)
  void clearSafetyTraining() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get brigadeId => $_getIZ(3);
  @$pb.TagNumber(5)
  set brigadeId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrigadeId() => $_has(3);
  @$pb.TagNumber(5)
  void clearBrigadeId() => clearField(5);
}

enum Person_PersonInfo {
  foremanInfo, 
  masterInfo, 
  managerInfo, 
  driverInfo, 
  technicianInfo, 
  welderInfo, 
  assemblerInfo, 
  plumberInfo, 
  notSet
}

class Person extends $pb.GeneratedMessage {
  factory Person({
    $core.int? id,
    $core.String? firstName,
    $core.String? secondName,
    $core.String? role,
    ForemanInfo? foremanInfo,
    MasterInfo? masterInfo,
    ManagerInfo? managerInfo,
    DriverInfo? driverInfo,
    TechnicianInfo? technicianInfo,
    WelderInfo? welderInfo,
    AssemblerInfo? assemblerInfo,
    PlumberInfo? plumberInfo,
    $2.Timestamp? birthDate,
    $core.String? phoneNumber,
    $core.String? email,
    $core.double? salary,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (secondName != null) {
      $result.secondName = secondName;
    }
    if (role != null) {
      $result.role = role;
    }
    if (foremanInfo != null) {
      $result.foremanInfo = foremanInfo;
    }
    if (masterInfo != null) {
      $result.masterInfo = masterInfo;
    }
    if (managerInfo != null) {
      $result.managerInfo = managerInfo;
    }
    if (driverInfo != null) {
      $result.driverInfo = driverInfo;
    }
    if (technicianInfo != null) {
      $result.technicianInfo = technicianInfo;
    }
    if (welderInfo != null) {
      $result.welderInfo = welderInfo;
    }
    if (assemblerInfo != null) {
      $result.assemblerInfo = assemblerInfo;
    }
    if (plumberInfo != null) {
      $result.plumberInfo = plumberInfo;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (email != null) {
      $result.email = email;
    }
    if (salary != null) {
      $result.salary = salary;
    }
    return $result;
  }
  Person._() : super();
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Person_PersonInfo> _Person_PersonInfoByTag = {
    5 : Person_PersonInfo.foremanInfo,
    6 : Person_PersonInfo.masterInfo,
    7 : Person_PersonInfo.managerInfo,
    8 : Person_PersonInfo.driverInfo,
    9 : Person_PersonInfo.technicianInfo,
    10 : Person_PersonInfo.welderInfo,
    11 : Person_PersonInfo.assemblerInfo,
    12 : Person_PersonInfo.plumberInfo,
    0 : Person_PersonInfo.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Person', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 8, 9, 10, 11, 12])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'secondName', protoName: 'secondName')
    ..aOS(4, _omitFieldNames ? '' : 'role')
    ..aOM<ForemanInfo>(5, _omitFieldNames ? '' : 'foremanInfo', protoName: 'foremanInfo', subBuilder: ForemanInfo.create)
    ..aOM<MasterInfo>(6, _omitFieldNames ? '' : 'masterInfo', protoName: 'masterInfo', subBuilder: MasterInfo.create)
    ..aOM<ManagerInfo>(7, _omitFieldNames ? '' : 'managerInfo', protoName: 'managerInfo', subBuilder: ManagerInfo.create)
    ..aOM<DriverInfo>(8, _omitFieldNames ? '' : 'driverInfo', protoName: 'driverInfo', subBuilder: DriverInfo.create)
    ..aOM<TechnicianInfo>(9, _omitFieldNames ? '' : 'technicianInfo', protoName: 'technicianInfo', subBuilder: TechnicianInfo.create)
    ..aOM<WelderInfo>(10, _omitFieldNames ? '' : 'welderInfo', protoName: 'welderInfo', subBuilder: WelderInfo.create)
    ..aOM<AssemblerInfo>(11, _omitFieldNames ? '' : 'assemblerInfo', protoName: 'assemblerInfo', subBuilder: AssemblerInfo.create)
    ..aOM<PlumberInfo>(12, _omitFieldNames ? '' : 'plumberInfo', protoName: 'plumberInfo', subBuilder: PlumberInfo.create)
    ..aOM<$2.Timestamp>(13, _omitFieldNames ? '' : 'birthDate', protoName: 'birthDate', subBuilder: $2.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'phoneNumber', protoName: 'phoneNumber')
    ..aOS(15, _omitFieldNames ? '' : 'email')
    ..a<$core.double>(16, _omitFieldNames ? '' : 'salary', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person)) as Person;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

  Person_PersonInfo whichPersonInfo() => _Person_PersonInfoByTag[$_whichOneof(0)]!;
  void clearPersonInfo() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secondName => $_getSZ(2);
  @$pb.TagNumber(3)
  set secondName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecondName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecondName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get role => $_getSZ(3);
  @$pb.TagNumber(4)
  set role($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);

  @$pb.TagNumber(5)
  ForemanInfo get foremanInfo => $_getN(4);
  @$pb.TagNumber(5)
  set foremanInfo(ForemanInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasForemanInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearForemanInfo() => clearField(5);
  @$pb.TagNumber(5)
  ForemanInfo ensureForemanInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  MasterInfo get masterInfo => $_getN(5);
  @$pb.TagNumber(6)
  set masterInfo(MasterInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMasterInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearMasterInfo() => clearField(6);
  @$pb.TagNumber(6)
  MasterInfo ensureMasterInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  ManagerInfo get managerInfo => $_getN(6);
  @$pb.TagNumber(7)
  set managerInfo(ManagerInfo v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasManagerInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearManagerInfo() => clearField(7);
  @$pb.TagNumber(7)
  ManagerInfo ensureManagerInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  DriverInfo get driverInfo => $_getN(7);
  @$pb.TagNumber(8)
  set driverInfo(DriverInfo v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDriverInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearDriverInfo() => clearField(8);
  @$pb.TagNumber(8)
  DriverInfo ensureDriverInfo() => $_ensure(7);

  @$pb.TagNumber(9)
  TechnicianInfo get technicianInfo => $_getN(8);
  @$pb.TagNumber(9)
  set technicianInfo(TechnicianInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTechnicianInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearTechnicianInfo() => clearField(9);
  @$pb.TagNumber(9)
  TechnicianInfo ensureTechnicianInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  WelderInfo get welderInfo => $_getN(9);
  @$pb.TagNumber(10)
  set welderInfo(WelderInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasWelderInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearWelderInfo() => clearField(10);
  @$pb.TagNumber(10)
  WelderInfo ensureWelderInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  AssemblerInfo get assemblerInfo => $_getN(10);
  @$pb.TagNumber(11)
  set assemblerInfo(AssemblerInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAssemblerInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearAssemblerInfo() => clearField(11);
  @$pb.TagNumber(11)
  AssemblerInfo ensureAssemblerInfo() => $_ensure(10);

  @$pb.TagNumber(12)
  PlumberInfo get plumberInfo => $_getN(11);
  @$pb.TagNumber(12)
  set plumberInfo(PlumberInfo v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasPlumberInfo() => $_has(11);
  @$pb.TagNumber(12)
  void clearPlumberInfo() => clearField(12);
  @$pb.TagNumber(12)
  PlumberInfo ensurePlumberInfo() => $_ensure(11);

  @$pb.TagNumber(13)
  $2.Timestamp get birthDate => $_getN(12);
  @$pb.TagNumber(13)
  set birthDate($2.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasBirthDate() => $_has(12);
  @$pb.TagNumber(13)
  void clearBirthDate() => clearField(13);
  @$pb.TagNumber(13)
  $2.Timestamp ensureBirthDate() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get phoneNumber => $_getSZ(13);
  @$pb.TagNumber(14)
  set phoneNumber($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPhoneNumber() => $_has(13);
  @$pb.TagNumber(14)
  void clearPhoneNumber() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get email => $_getSZ(14);
  @$pb.TagNumber(15)
  set email($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasEmail() => $_has(14);
  @$pb.TagNumber(15)
  void clearEmail() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get salary => $_getN(15);
  @$pb.TagNumber(16)
  set salary($core.double v) { $_setFloat(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSalary() => $_has(15);
  @$pb.TagNumber(16)
  void clearSalary() => clearField(16);
}

class PersonList extends $pb.GeneratedMessage {
  factory PersonList({
    $core.Iterable<Person>? persons,
  }) {
    final $result = create();
    if (persons != null) {
      $result.persons.addAll(persons);
    }
    return $result;
  }
  PersonList._() : super();
  factory PersonList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Person>(1, _omitFieldNames ? '' : 'persons', $pb.PbFieldType.PM, subBuilder: Person.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PersonList clone() => PersonList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonList copyWith(void Function(PersonList) updates) => super.copyWith((message) => updates(message as PersonList)) as PersonList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonList create() => PersonList._();
  PersonList createEmptyInstance() => create();
  static $pb.PbList<PersonList> createRepeated() => $pb.PbList<PersonList>();
  @$core.pragma('dart2js:noInline')
  static PersonList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonList>(create);
  static PersonList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Person> get persons => $_getList(0);
}

class BrigadeList extends $pb.GeneratedMessage {
  factory BrigadeList({
    $core.Iterable<Brigade>? brigades,
  }) {
    final $result = create();
    if (brigades != null) {
      $result.brigades.addAll(brigades);
    }
    return $result;
  }
  BrigadeList._() : super();
  factory BrigadeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BrigadeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BrigadeList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Brigade>(1, _omitFieldNames ? '' : 'brigades', $pb.PbFieldType.PM, subBuilder: Brigade.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BrigadeList clone() => BrigadeList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BrigadeList copyWith(void Function(BrigadeList) updates) => super.copyWith((message) => updates(message as BrigadeList)) as BrigadeList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BrigadeList create() => BrigadeList._();
  BrigadeList createEmptyInstance() => create();
  static $pb.PbList<BrigadeList> createRepeated() => $pb.PbList<BrigadeList>();
  @$core.pragma('dart2js:noInline')
  static BrigadeList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BrigadeList>(create);
  static BrigadeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Brigade> get brigades => $_getList(0);
}

class RepairWorkList extends $pb.GeneratedMessage {
  factory RepairWorkList({
    $core.Iterable<RepairWork>? repairWorks,
  }) {
    final $result = create();
    if (repairWorks != null) {
      $result.repairWorks.addAll(repairWorks);
    }
    return $result;
  }
  RepairWorkList._() : super();
  factory RepairWorkList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairWorkList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairWorkList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<RepairWork>(1, _omitFieldNames ? '' : 'repairWorks', $pb.PbFieldType.PM, protoName: 'repairWorks', subBuilder: RepairWork.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairWorkList clone() => RepairWorkList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairWorkList copyWith(void Function(RepairWorkList) updates) => super.copyWith((message) => updates(message as RepairWorkList)) as RepairWorkList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairWorkList create() => RepairWorkList._();
  RepairWorkList createEmptyInstance() => create();
  static $pb.PbList<RepairWorkList> createRepeated() => $pb.PbList<RepairWorkList>();
  @$core.pragma('dart2js:noInline')
  static RepairWorkList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairWorkList>(create);
  static RepairWorkList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RepairWork> get repairWorks => $_getList(0);
}

class MasterFilter extends $pb.GeneratedMessage {
  factory MasterFilter({
    $core.int? managerId,
  }) {
    final $result = create();
    if (managerId != null) {
      $result.managerId = managerId;
    }
    return $result;
  }
  MasterFilter._() : super();
  factory MasterFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MasterFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MasterFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'managerId', $pb.PbFieldType.O3, protoName: 'managerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MasterFilter clone() => MasterFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MasterFilter copyWith(void Function(MasterFilter) updates) => super.copyWith((message) => updates(message as MasterFilter)) as MasterFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MasterFilter create() => MasterFilter._();
  MasterFilter createEmptyInstance() => create();
  static $pb.PbList<MasterFilter> createRepeated() => $pb.PbList<MasterFilter>();
  @$core.pragma('dart2js:noInline')
  static MasterFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MasterFilter>(create);
  static MasterFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get managerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set managerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasManagerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearManagerId() => clearField(1);
}

class ForemanFilter extends $pb.GeneratedMessage {
  factory ForemanFilter({
    $core.int? masterId,
  }) {
    final $result = create();
    if (masterId != null) {
      $result.masterId = masterId;
    }
    return $result;
  }
  ForemanFilter._() : super();
  factory ForemanFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForemanFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForemanFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'masterId', $pb.PbFieldType.O3, protoName: 'masterId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForemanFilter clone() => ForemanFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForemanFilter copyWith(void Function(ForemanFilter) updates) => super.copyWith((message) => updates(message as ForemanFilter)) as ForemanFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForemanFilter create() => ForemanFilter._();
  ForemanFilter createEmptyInstance() => create();
  static $pb.PbList<ForemanFilter> createRepeated() => $pb.PbList<ForemanFilter>();
  @$core.pragma('dart2js:noInline')
  static ForemanFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForemanFilter>(create);
  static ForemanFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get masterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set masterId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMasterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMasterId() => clearField(1);
}

class ServicePersonnelFilter extends $pb.GeneratedMessage {
  factory ServicePersonnelFilter({
    $core.int? foremanId,
  }) {
    final $result = create();
    if (foremanId != null) {
      $result.foremanId = foremanId;
    }
    return $result;
  }
  ServicePersonnelFilter._() : super();
  factory ServicePersonnelFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServicePersonnelFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServicePersonnelFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'foremanId', $pb.PbFieldType.O3, protoName: 'foremanId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServicePersonnelFilter clone() => ServicePersonnelFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServicePersonnelFilter copyWith(void Function(ServicePersonnelFilter) updates) => super.copyWith((message) => updates(message as ServicePersonnelFilter)) as ServicePersonnelFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServicePersonnelFilter create() => ServicePersonnelFilter._();
  ServicePersonnelFilter createEmptyInstance() => create();
  static $pb.PbList<ServicePersonnelFilter> createRepeated() => $pb.PbList<ServicePersonnelFilter>();
  @$core.pragma('dart2js:noInline')
  static ServicePersonnelFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServicePersonnelFilter>(create);
  static ServicePersonnelFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get foremanId => $_getIZ(0);
  @$pb.TagNumber(1)
  set foremanId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForemanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForemanId() => clearField(1);
}

enum PersonFilter_RoleBasedFilter {
  masterFilter, 
  foremanFilter, 
  servicePersonnelFilter, 
  notSet
}

class PersonFilter extends $pb.GeneratedMessage {
  factory PersonFilter({
    $core.Iterable<Role>? roles,
    $core.int? brigadeId,
    $core.Iterable<$core.int>? ids,
    MasterFilter? masterFilter,
    ForemanFilter? foremanFilter,
    ServicePersonnelFilter? servicePersonnelFilter,
  }) {
    final $result = create();
    if (roles != null) {
      $result.roles.addAll(roles);
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (masterFilter != null) {
      $result.masterFilter = masterFilter;
    }
    if (foremanFilter != null) {
      $result.foremanFilter = foremanFilter;
    }
    if (servicePersonnelFilter != null) {
      $result.servicePersonnelFilter = servicePersonnelFilter;
    }
    return $result;
  }
  PersonFilter._() : super();
  factory PersonFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PersonFilter_RoleBasedFilter> _PersonFilter_RoleBasedFilterByTag = {
    4 : PersonFilter_RoleBasedFilter.masterFilter,
    5 : PersonFilter_RoleBasedFilter.foremanFilter,
    6 : PersonFilter_RoleBasedFilter.servicePersonnelFilter,
    0 : PersonFilter_RoleBasedFilter.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6])
    ..pc<Role>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.KE, valueOf: Role.valueOf, enumValues: Role.values, defaultEnumValue: Role.foreman)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..p<$core.int>(3, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..aOM<MasterFilter>(4, _omitFieldNames ? '' : 'masterFilter', protoName: 'masterFilter', subBuilder: MasterFilter.create)
    ..aOM<ForemanFilter>(5, _omitFieldNames ? '' : 'foremanFilter', protoName: 'foremanFilter', subBuilder: ForemanFilter.create)
    ..aOM<ServicePersonnelFilter>(6, _omitFieldNames ? '' : 'servicePersonnelFilter', protoName: 'servicePersonnelFilter', subBuilder: ServicePersonnelFilter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PersonFilter clone() => PersonFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonFilter copyWith(void Function(PersonFilter) updates) => super.copyWith((message) => updates(message as PersonFilter)) as PersonFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonFilter create() => PersonFilter._();
  PersonFilter createEmptyInstance() => create();
  static $pb.PbList<PersonFilter> createRepeated() => $pb.PbList<PersonFilter>();
  @$core.pragma('dart2js:noInline')
  static PersonFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonFilter>(create);
  static PersonFilter? _defaultInstance;

  PersonFilter_RoleBasedFilter whichRoleBasedFilter() => _PersonFilter_RoleBasedFilterByTag[$_whichOneof(0)]!;
  void clearRoleBasedFilter() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<Role> get roles => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get brigadeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set brigadeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBrigadeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBrigadeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ids => $_getList(2);

  @$pb.TagNumber(4)
  MasterFilter get masterFilter => $_getN(3);
  @$pb.TagNumber(4)
  set masterFilter(MasterFilter v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMasterFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearMasterFilter() => clearField(4);
  @$pb.TagNumber(4)
  MasterFilter ensureMasterFilter() => $_ensure(3);

  @$pb.TagNumber(5)
  ForemanFilter get foremanFilter => $_getN(4);
  @$pb.TagNumber(5)
  set foremanFilter(ForemanFilter v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasForemanFilter() => $_has(4);
  @$pb.TagNumber(5)
  void clearForemanFilter() => clearField(5);
  @$pb.TagNumber(5)
  ForemanFilter ensureForemanFilter() => $_ensure(4);

  @$pb.TagNumber(6)
  ServicePersonnelFilter get servicePersonnelFilter => $_getN(5);
  @$pb.TagNumber(6)
  set servicePersonnelFilter(ServicePersonnelFilter v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasServicePersonnelFilter() => $_has(5);
  @$pb.TagNumber(6)
  void clearServicePersonnelFilter() => clearField(6);
  @$pb.TagNumber(6)
  ServicePersonnelFilter ensureServicePersonnelFilter() => $_ensure(5);
}

class RepairWorkFilter_DateRange extends $pb.GeneratedMessage {
  factory RepairWorkFilter_DateRange({
    $2.Timestamp? dateFrom,
    $2.Timestamp? dateTo,
  }) {
    final $result = create();
    if (dateFrom != null) {
      $result.dateFrom = dateFrom;
    }
    if (dateTo != null) {
      $result.dateTo = dateTo;
    }
    return $result;
  }
  RepairWorkFilter_DateRange._() : super();
  factory RepairWorkFilter_DateRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairWorkFilter_DateRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairWorkFilter.DateRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'dateFrom', protoName: 'dateFrom', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'dateTo', protoName: 'dateTo', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairWorkFilter_DateRange clone() => RepairWorkFilter_DateRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairWorkFilter_DateRange copyWith(void Function(RepairWorkFilter_DateRange) updates) => super.copyWith((message) => updates(message as RepairWorkFilter_DateRange)) as RepairWorkFilter_DateRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairWorkFilter_DateRange create() => RepairWorkFilter_DateRange._();
  RepairWorkFilter_DateRange createEmptyInstance() => create();
  static $pb.PbList<RepairWorkFilter_DateRange> createRepeated() => $pb.PbList<RepairWorkFilter_DateRange>();
  @$core.pragma('dart2js:noInline')
  static RepairWorkFilter_DateRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairWorkFilter_DateRange>(create);
  static RepairWorkFilter_DateRange? _defaultInstance;

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
}

class RepairWorkFilter extends $pb.GeneratedMessage {
  factory RepairWorkFilter({
    $core.Iterable<RepairState>? states,
    $core.int? brigadeId,
    RepairWorkFilter_DateRange? dateRange,
    $core.int? transportId,
    $core.int? servicePersonnelId,
    $core.int? unitId,
    $core.String? transportBrand,
    $core.String? transportType,
    $core.Iterable<$core.int>? ids,
  }) {
    final $result = create();
    if (states != null) {
      $result.states.addAll(states);
    }
    if (brigadeId != null) {
      $result.brigadeId = brigadeId;
    }
    if (dateRange != null) {
      $result.dateRange = dateRange;
    }
    if (transportId != null) {
      $result.transportId = transportId;
    }
    if (servicePersonnelId != null) {
      $result.servicePersonnelId = servicePersonnelId;
    }
    if (unitId != null) {
      $result.unitId = unitId;
    }
    if (transportBrand != null) {
      $result.transportBrand = transportBrand;
    }
    if (transportType != null) {
      $result.transportType = transportType;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  RepairWorkFilter._() : super();
  factory RepairWorkFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairWorkFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairWorkFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<RepairState>(1, _omitFieldNames ? '' : 'states', $pb.PbFieldType.KE, valueOf: RepairState.valueOf, enumValues: RepairState.values, defaultEnumValue: RepairState.in_progress)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'brigadeId', $pb.PbFieldType.O3, protoName: 'brigadeId')
    ..aOM<RepairWorkFilter_DateRange>(3, _omitFieldNames ? '' : 'dateRange', protoName: 'dateRange', subBuilder: RepairWorkFilter_DateRange.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'servicePersonnelId', $pb.PbFieldType.O3, protoName: 'servicePersonnelId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'unitId', $pb.PbFieldType.O3, protoName: 'unitId')
    ..aOS(7, _omitFieldNames ? '' : 'transportBrand', protoName: 'transportBrand')
    ..aOS(8, _omitFieldNames ? '' : 'transportType', protoName: 'transportType')
    ..p<$core.int>(9, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairWorkFilter clone() => RepairWorkFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairWorkFilter copyWith(void Function(RepairWorkFilter) updates) => super.copyWith((message) => updates(message as RepairWorkFilter)) as RepairWorkFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairWorkFilter create() => RepairWorkFilter._();
  RepairWorkFilter createEmptyInstance() => create();
  static $pb.PbList<RepairWorkFilter> createRepeated() => $pb.PbList<RepairWorkFilter>();
  @$core.pragma('dart2js:noInline')
  static RepairWorkFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairWorkFilter>(create);
  static RepairWorkFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RepairState> get states => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get brigadeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set brigadeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBrigadeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBrigadeId() => clearField(2);

  @$pb.TagNumber(3)
  RepairWorkFilter_DateRange get dateRange => $_getN(2);
  @$pb.TagNumber(3)
  set dateRange(RepairWorkFilter_DateRange v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateRange() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateRange() => clearField(3);
  @$pb.TagNumber(3)
  RepairWorkFilter_DateRange ensureDateRange() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get transportId => $_getIZ(3);
  @$pb.TagNumber(4)
  set transportId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTransportId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransportId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get servicePersonnelId => $_getIZ(4);
  @$pb.TagNumber(5)
  set servicePersonnelId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServicePersonnelId() => $_has(4);
  @$pb.TagNumber(5)
  void clearServicePersonnelId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get unitId => $_getIZ(5);
  @$pb.TagNumber(6)
  set unitId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnitId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get transportBrand => $_getSZ(6);
  @$pb.TagNumber(7)
  set transportBrand($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTransportBrand() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransportBrand() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get transportType => $_getSZ(7);
  @$pb.TagNumber(8)
  set transportType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTransportType() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransportType() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get ids => $_getList(8);
}

class TransportUnitList extends $pb.GeneratedMessage {
  factory TransportUnitList({
    $core.Iterable<TransportUnit>? units,
  }) {
    final $result = create();
    if (units != null) {
      $result.units.addAll(units);
    }
    return $result;
  }
  TransportUnitList._() : super();
  factory TransportUnitList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportUnitList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportUnitList', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<TransportUnit>(1, _omitFieldNames ? '' : 'units', $pb.PbFieldType.PM, subBuilder: TransportUnit.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportUnitList clone() => TransportUnitList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportUnitList copyWith(void Function(TransportUnitList) updates) => super.copyWith((message) => updates(message as TransportUnitList)) as TransportUnitList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportUnitList create() => TransportUnitList._();
  TransportUnitList createEmptyInstance() => create();
  static $pb.PbList<TransportUnitList> createRepeated() => $pb.PbList<TransportUnitList>();
  @$core.pragma('dart2js:noInline')
  static TransportUnitList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportUnitList>(create);
  static TransportUnitList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransportUnit> get units => $_getList(0);
}

class DriversRequest extends $pb.GeneratedMessage {
  factory DriversRequest({
    $core.int? transportId,
  }) {
    final $result = create();
    if (transportId != null) {
      $result.transportId = transportId;
    }
    return $result;
  }
  DriversRequest._() : super();
  factory DriversRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DriversRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DriversRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DriversRequest clone() => DriversRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DriversRequest copyWith(void Function(DriversRequest) updates) => super.copyWith((message) => updates(message as DriversRequest)) as DriversRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DriversRequest create() => DriversRequest._();
  DriversRequest createEmptyInstance() => create();
  static $pb.PbList<DriversRequest> createRepeated() => $pb.PbList<DriversRequest>();
  @$core.pragma('dart2js:noInline')
  static DriversRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DriversRequest>(create);
  static DriversRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get transportId => $_getIZ(0);
  @$pb.TagNumber(1)
  set transportId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransportId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
