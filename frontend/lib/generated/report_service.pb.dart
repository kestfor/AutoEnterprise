//
//  Generated code. Do not modify.
//  source: report_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

class CarMileageRequest extends $pb.GeneratedMessage {
  factory CarMileageRequest({
    $core.String? category,
    $core.int? transportId,
    $2.Timestamp? dateFrom,
    $2.Timestamp? dateTo,
  }) {
    final $result = create();
    if (category != null) {
      $result.category = category;
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
    return $result;
  }
  CarMileageRequest._() : super();
  factory CarMileageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CarMileageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CarMileageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'dateFrom', protoName: 'dateFrom', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'dateTo', protoName: 'dateTo', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CarMileageRequest clone() => CarMileageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CarMileageRequest copyWith(void Function(CarMileageRequest) updates) => super.copyWith((message) => updates(message as CarMileageRequest)) as CarMileageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarMileageRequest create() => CarMileageRequest._();
  CarMileageRequest createEmptyInstance() => create();
  static $pb.PbList<CarMileageRequest> createRepeated() => $pb.PbList<CarMileageRequest>();
  @$core.pragma('dart2js:noInline')
  static CarMileageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CarMileageRequest>(create);
  static CarMileageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get transportId => $_getIZ(1);
  @$pb.TagNumber(2)
  set transportId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransportId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransportId() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get dateFrom => $_getN(2);
  @$pb.TagNumber(3)
  set dateFrom($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateFrom() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDateFrom() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get dateTo => $_getN(3);
  @$pb.TagNumber(4)
  set dateTo($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateTo() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDateTo() => $_ensure(3);
}

class RepairCostRequest extends $pb.GeneratedMessage {
  factory RepairCostRequest({
    $core.String? category,
    $core.int? transportId,
    $2.Timestamp? dateFrom,
    $2.Timestamp? dateTo,
    $core.String? brand,
  }) {
    final $result = create();
    if (category != null) {
      $result.category = category;
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
    if (brand != null) {
      $result.brand = brand;
    }
    return $result;
  }
  RepairCostRequest._() : super();
  factory RepairCostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairCostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairCostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'transportId', $pb.PbFieldType.O3, protoName: 'transportId')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'dateFrom', protoName: 'dateFrom', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'dateTo', protoName: 'dateTo', subBuilder: $2.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'brand')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairCostRequest clone() => RepairCostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairCostRequest copyWith(void Function(RepairCostRequest) updates) => super.copyWith((message) => updates(message as RepairCostRequest)) as RepairCostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairCostRequest create() => RepairCostRequest._();
  RepairCostRequest createEmptyInstance() => create();
  static $pb.PbList<RepairCostRequest> createRepeated() => $pb.PbList<RepairCostRequest>();
  @$core.pragma('dart2js:noInline')
  static RepairCostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairCostRequest>(create);
  static RepairCostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get transportId => $_getIZ(1);
  @$pb.TagNumber(2)
  set transportId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransportId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransportId() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get dateFrom => $_getN(2);
  @$pb.TagNumber(3)
  set dateFrom($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateFrom() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDateFrom() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get dateTo => $_getN(3);
  @$pb.TagNumber(4)
  set dateTo($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateTo() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDateTo() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get brand => $_getSZ(4);
  @$pb.TagNumber(5)
  set brand($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrand() => $_has(4);
  @$pb.TagNumber(5)
  void clearBrand() => clearField(5);
}

class CarMileageResponse extends $pb.GeneratedMessage {
  factory CarMileageResponse({
    $core.Map<$core.String, $core.double>? carMileage,
  }) {
    final $result = create();
    if (carMileage != null) {
      $result.carMileage.addAll(carMileage);
    }
    return $result;
  }
  CarMileageResponse._() : super();
  factory CarMileageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CarMileageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CarMileageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..m<$core.String, $core.double>(1, _omitFieldNames ? '' : 'carMileage', protoName: 'carMileage', entryClassName: 'CarMileageResponse.CarMileageEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OF, packageName: const $pb.PackageName('main'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CarMileageResponse clone() => CarMileageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CarMileageResponse copyWith(void Function(CarMileageResponse) updates) => super.copyWith((message) => updates(message as CarMileageResponse)) as CarMileageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarMileageResponse create() => CarMileageResponse._();
  CarMileageResponse createEmptyInstance() => create();
  static $pb.PbList<CarMileageResponse> createRepeated() => $pb.PbList<CarMileageResponse>();
  @$core.pragma('dart2js:noInline')
  static CarMileageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CarMileageResponse>(create);
  static CarMileageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.double> get carMileage => $_getMap(0);
}

class RepairCost extends $pb.GeneratedMessage {
  factory RepairCost({
    $core.String? name,
    $core.double? sum,
    $core.int? repairNum,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (sum != null) {
      $result.sum = sum;
    }
    if (repairNum != null) {
      $result.repairNum = repairNum;
    }
    return $result;
  }
  RepairCost._() : super();
  factory RepairCost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairCost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairCost', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'sum', $pb.PbFieldType.OF)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'repairNum', $pb.PbFieldType.O3, protoName: 'repairNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairCost clone() => RepairCost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairCost copyWith(void Function(RepairCost) updates) => super.copyWith((message) => updates(message as RepairCost)) as RepairCost;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairCost create() => RepairCost._();
  RepairCost createEmptyInstance() => create();
  static $pb.PbList<RepairCost> createRepeated() => $pb.PbList<RepairCost>();
  @$core.pragma('dart2js:noInline')
  static RepairCost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairCost>(create);
  static RepairCost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get sum => $_getN(1);
  @$pb.TagNumber(2)
  set sum($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get repairNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set repairNum($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRepairNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepairNum() => clearField(3);
}

class RepairCostResponse extends $pb.GeneratedMessage {
  factory RepairCostResponse({
    $core.Iterable<RepairCost>? costs,
  }) {
    final $result = create();
    if (costs != null) {
      $result.costs.addAll(costs);
    }
    return $result;
  }
  RepairCostResponse._() : super();
  factory RepairCostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepairCostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepairCostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<RepairCost>(1, _omitFieldNames ? '' : 'costs', $pb.PbFieldType.PM, subBuilder: RepairCost.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepairCostResponse clone() => RepairCostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepairCostResponse copyWith(void Function(RepairCostResponse) updates) => super.copyWith((message) => updates(message as RepairCostResponse)) as RepairCostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepairCostResponse create() => RepairCostResponse._();
  RepairCostResponse createEmptyInstance() => create();
  static $pb.PbList<RepairCostResponse> createRepeated() => $pb.PbList<RepairCostResponse>();
  @$core.pragma('dart2js:noInline')
  static RepairCostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepairCostResponse>(create);
  static RepairCostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RepairCost> get costs => $_getList(0);
}

class DriversDistributionResponse extends $pb.GeneratedMessage {
  factory DriversDistributionResponse({
    $core.Map<$core.String, $core.String>? driversDistribution,
  }) {
    final $result = create();
    if (driversDistribution != null) {
      $result.driversDistribution.addAll(driversDistribution);
    }
    return $result;
  }
  DriversDistributionResponse._() : super();
  factory DriversDistributionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DriversDistributionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DriversDistributionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'driversDistribution', protoName: 'driversDistribution', entryClassName: 'DriversDistributionResponse.DriversDistributionEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('main'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DriversDistributionResponse clone() => DriversDistributionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DriversDistributionResponse copyWith(void Function(DriversDistributionResponse) updates) => super.copyWith((message) => updates(message as DriversDistributionResponse)) as DriversDistributionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DriversDistributionResponse create() => DriversDistributionResponse._();
  DriversDistributionResponse createEmptyInstance() => create();
  static $pb.PbList<DriversDistributionResponse> createRepeated() => $pb.PbList<DriversDistributionResponse>();
  @$core.pragma('dart2js:noInline')
  static DriversDistributionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DriversDistributionResponse>(create);
  static DriversDistributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get driversDistribution => $_getMap(0);
}

class PassengerTransportDistributionResponse extends $pb.GeneratedMessage {
  factory PassengerTransportDistributionResponse({
    $core.Map<$core.String, $core.String>? passengerTransportDistribution,
  }) {
    final $result = create();
    if (passengerTransportDistribution != null) {
      $result.passengerTransportDistribution.addAll(passengerTransportDistribution);
    }
    return $result;
  }
  PassengerTransportDistributionResponse._() : super();
  factory PassengerTransportDistributionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PassengerTransportDistributionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PassengerTransportDistributionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'passengerTransportDistribution', protoName: 'passengerTransportDistribution', entryClassName: 'PassengerTransportDistributionResponse.PassengerTransportDistributionEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('main'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PassengerTransportDistributionResponse clone() => PassengerTransportDistributionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PassengerTransportDistributionResponse copyWith(void Function(PassengerTransportDistributionResponse) updates) => super.copyWith((message) => updates(message as PassengerTransportDistributionResponse)) as PassengerTransportDistributionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PassengerTransportDistributionResponse create() => PassengerTransportDistributionResponse._();
  PassengerTransportDistributionResponse createEmptyInstance() => create();
  static $pb.PbList<PassengerTransportDistributionResponse> createRepeated() => $pb.PbList<PassengerTransportDistributionResponse>();
  @$core.pragma('dart2js:noInline')
  static PassengerTransportDistributionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PassengerTransportDistributionResponse>(create);
  static PassengerTransportDistributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get passengerTransportDistribution => $_getMap(0);
}

class Subordination extends $pb.GeneratedMessage {
  factory Subordination({
    $core.String? personName,
    $core.int? personId,
    $core.Iterable<Subordination>? subordinates,
    $core.String? role,
  }) {
    final $result = create();
    if (personName != null) {
      $result.personName = personName;
    }
    if (personId != null) {
      $result.personId = personId;
    }
    if (subordinates != null) {
      $result.subordinates.addAll(subordinates);
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }
  Subordination._() : super();
  factory Subordination.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Subordination.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Subordination', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'personName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.O3)
    ..pc<Subordination>(3, _omitFieldNames ? '' : 'subordinates', $pb.PbFieldType.PM, subBuilder: Subordination.create)
    ..aOS(4, _omitFieldNames ? '' : 'role')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Subordination clone() => Subordination()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Subordination copyWith(void Function(Subordination) updates) => super.copyWith((message) => updates(message as Subordination)) as Subordination;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subordination create() => Subordination._();
  Subordination createEmptyInstance() => create();
  static $pb.PbList<Subordination> createRepeated() => $pb.PbList<Subordination>();
  @$core.pragma('dart2js:noInline')
  static Subordination getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Subordination>(create);
  static Subordination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get personName => $_getSZ(0);
  @$pb.TagNumber(1)
  set personName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get personId => $_getIZ(1);
  @$pb.TagNumber(2)
  set personId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Subordination> get subordinates => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get role => $_getSZ(3);
  @$pb.TagNumber(4)
  set role($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);
}

class SubordinationResponse extends $pb.GeneratedMessage {
  factory SubordinationResponse({
    $core.Iterable<Subordination>? subordinations,
  }) {
    final $result = create();
    if (subordinations != null) {
      $result.subordinations.addAll(subordinations);
    }
    return $result;
  }
  SubordinationResponse._() : super();
  factory SubordinationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubordinationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubordinationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..pc<Subordination>(1, _omitFieldNames ? '' : 'subordinations', $pb.PbFieldType.PM, subBuilder: Subordination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubordinationResponse clone() => SubordinationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubordinationResponse copyWith(void Function(SubordinationResponse) updates) => super.copyWith((message) => updates(message as SubordinationResponse)) as SubordinationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubordinationResponse create() => SubordinationResponse._();
  SubordinationResponse createEmptyInstance() => create();
  static $pb.PbList<SubordinationResponse> createRepeated() => $pb.PbList<SubordinationResponse>();
  @$core.pragma('dart2js:noInline')
  static SubordinationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubordinationResponse>(create);
  static SubordinationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Subordination> get subordinations => $_getList(0);
}

class TransportByGarageDistributionResponse extends $pb.GeneratedMessage {
  factory TransportByGarageDistributionResponse({
    $core.Map<$core.String, $core.String>? mapping,
  }) {
    final $result = create();
    if (mapping != null) {
      $result.mapping.addAll(mapping);
    }
    return $result;
  }
  TransportByGarageDistributionResponse._() : super();
  factory TransportByGarageDistributionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransportByGarageDistributionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransportByGarageDistributionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'mapping', entryClassName: 'TransportByGarageDistributionResponse.MappingEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('main'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransportByGarageDistributionResponse clone() => TransportByGarageDistributionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransportByGarageDistributionResponse copyWith(void Function(TransportByGarageDistributionResponse) updates) => super.copyWith((message) => updates(message as TransportByGarageDistributionResponse)) as TransportByGarageDistributionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransportByGarageDistributionResponse create() => TransportByGarageDistributionResponse._();
  TransportByGarageDistributionResponse createEmptyInstance() => create();
  static $pb.PbList<TransportByGarageDistributionResponse> createRepeated() => $pb.PbList<TransportByGarageDistributionResponse>();
  @$core.pragma('dart2js:noInline')
  static TransportByGarageDistributionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransportByGarageDistributionResponse>(create);
  static TransportByGarageDistributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get mapping => $_getMap(0);
}

class SubordinationRequest_Filter extends $pb.GeneratedMessage {
  factory SubordinationRequest_Filter({
    $core.int? personId,
    $core.String? personRole,
  }) {
    final $result = create();
    if (personId != null) {
      $result.personId = personId;
    }
    if (personRole != null) {
      $result.personRole = personRole;
    }
    return $result;
  }
  SubordinationRequest_Filter._() : super();
  factory SubordinationRequest_Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubordinationRequest_Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubordinationRequest.Filter', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.O3, protoName: 'personId')
    ..aOS(2, _omitFieldNames ? '' : 'personRole', protoName: 'personRole')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubordinationRequest_Filter clone() => SubordinationRequest_Filter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubordinationRequest_Filter copyWith(void Function(SubordinationRequest_Filter) updates) => super.copyWith((message) => updates(message as SubordinationRequest_Filter)) as SubordinationRequest_Filter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubordinationRequest_Filter create() => SubordinationRequest_Filter._();
  SubordinationRequest_Filter createEmptyInstance() => create();
  static $pb.PbList<SubordinationRequest_Filter> createRepeated() => $pb.PbList<SubordinationRequest_Filter>();
  @$core.pragma('dart2js:noInline')
  static SubordinationRequest_Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubordinationRequest_Filter>(create);
  static SubordinationRequest_Filter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get personId => $_getIZ(0);
  @$pb.TagNumber(1)
  set personId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get personRole => $_getSZ(1);
  @$pb.TagNumber(2)
  set personRole($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonRole() => clearField(2);
}

class SubordinationRequest extends $pb.GeneratedMessage {
  factory SubordinationRequest({
    SubordinationRequest_Filter? filter,
  }) {
    final $result = create();
    if (filter != null) {
      $result.filter = filter;
    }
    return $result;
  }
  SubordinationRequest._() : super();
  factory SubordinationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubordinationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubordinationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'main'), createEmptyInstance: create)
    ..aOM<SubordinationRequest_Filter>(1, _omitFieldNames ? '' : 'filter', subBuilder: SubordinationRequest_Filter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubordinationRequest clone() => SubordinationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubordinationRequest copyWith(void Function(SubordinationRequest) updates) => super.copyWith((message) => updates(message as SubordinationRequest)) as SubordinationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubordinationRequest create() => SubordinationRequest._();
  SubordinationRequest createEmptyInstance() => create();
  static $pb.PbList<SubordinationRequest> createRepeated() => $pb.PbList<SubordinationRequest>();
  @$core.pragma('dart2js:noInline')
  static SubordinationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubordinationRequest>(create);
  static SubordinationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SubordinationRequest_Filter get filter => $_getN(0);
  @$pb.TagNumber(1)
  set filter(SubordinationRequest_Filter v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
  @$pb.TagNumber(1)
  SubordinationRequest_Filter ensureFilter() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
