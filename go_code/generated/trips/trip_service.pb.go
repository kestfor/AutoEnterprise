// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.5
// 	protoc        v5.28.2
// source: proto/trip_service.proto

package __

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
	unsafe "unsafe"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type TripType int32

const (
	TripType_cargo     TripType = 0
	TripType_passenger TripType = 1
)

// Enum value maps for TripType.
var (
	TripType_name = map[int32]string{
		0: "cargo",
		1: "passenger",
	}
	TripType_value = map[string]int32{
		"cargo":     0,
		"passenger": 1,
	}
)

func (x TripType) Enum() *TripType {
	p := new(TripType)
	*p = x
	return p
}

func (x TripType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (TripType) Descriptor() protoreflect.EnumDescriptor {
	return file_proto_trip_service_proto_enumTypes[0].Descriptor()
}

func (TripType) Type() protoreflect.EnumType {
	return &file_proto_trip_service_proto_enumTypes[0]
}

func (x TripType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use TripType.Descriptor instead.
func (TripType) EnumDescriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{0}
}

type TripInfoCargo struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Id            int32                  `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	CargoType     string                 `protobuf:"bytes,2,opt,name=cargoType,proto3" json:"cargoType,omitempty"`
	CargoName     string                 `protobuf:"bytes,3,opt,name=cargoName,proto3" json:"cargoName,omitempty"`
	CargoWeight   float32                `protobuf:"fixed32,4,opt,name=cargoWeight,proto3" json:"cargoWeight,omitempty"`
	CargoCost     float32                `protobuf:"fixed32,5,opt,name=cargoCost,proto3" json:"cargoCost,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *TripInfoCargo) Reset() {
	*x = TripInfoCargo{}
	mi := &file_proto_trip_service_proto_msgTypes[0]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *TripInfoCargo) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TripInfoCargo) ProtoMessage() {}

func (x *TripInfoCargo) ProtoReflect() protoreflect.Message {
	mi := &file_proto_trip_service_proto_msgTypes[0]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TripInfoCargo.ProtoReflect.Descriptor instead.
func (*TripInfoCargo) Descriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{0}
}

func (x *TripInfoCargo) GetId() int32 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *TripInfoCargo) GetCargoType() string {
	if x != nil {
		return x.CargoType
	}
	return ""
}

func (x *TripInfoCargo) GetCargoName() string {
	if x != nil {
		return x.CargoName
	}
	return ""
}

func (x *TripInfoCargo) GetCargoWeight() float32 {
	if x != nil {
		return x.CargoWeight
	}
	return 0
}

func (x *TripInfoCargo) GetCargoCost() float32 {
	if x != nil {
		return x.CargoCost
	}
	return 0
}

type TripInfoPassenger struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Id            int32                  `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	PassengersNum int32                  `protobuf:"varint,2,opt,name=passengersNum,proto3" json:"passengersNum,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *TripInfoPassenger) Reset() {
	*x = TripInfoPassenger{}
	mi := &file_proto_trip_service_proto_msgTypes[1]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *TripInfoPassenger) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TripInfoPassenger) ProtoMessage() {}

func (x *TripInfoPassenger) ProtoReflect() protoreflect.Message {
	mi := &file_proto_trip_service_proto_msgTypes[1]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TripInfoPassenger.ProtoReflect.Descriptor instead.
func (*TripInfoPassenger) Descriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{1}
}

func (x *TripInfoPassenger) GetId() int32 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *TripInfoPassenger) GetPassengersNum() int32 {
	if x != nil {
		return x.PassengersNum
	}
	return 0
}

type Trip struct {
	state       protoimpl.MessageState `protogen:"open.v1"`
	Id          *int32                 `protobuf:"varint,1,opt,name=id,proto3,oneof" json:"id,omitempty"`
	RouteId     *int32                 `protobuf:"varint,2,opt,name=routeId,proto3,oneof" json:"routeId,omitempty"`
	DriverId    *int32                 `protobuf:"varint,3,opt,name=driverId,proto3,oneof" json:"driverId,omitempty"`
	TransportId *int32                 `protobuf:"varint,4,opt,name=transportId,proto3,oneof" json:"transportId,omitempty"`
	StartTime   *timestamppb.Timestamp `protobuf:"bytes,5,opt,name=startTime,proto3" json:"startTime,omitempty"`
	EndTime     *timestamppb.Timestamp `protobuf:"bytes,6,opt,name=endTime,proto3,oneof" json:"endTime,omitempty"`
	Type        string                 `protobuf:"bytes,7,opt,name=type,proto3" json:"type,omitempty"`
	Distance    *float32               `protobuf:"fixed32,10,opt,name=distance,proto3,oneof" json:"distance,omitempty"`
	// Types that are valid to be assigned to TripInfo:
	//
	//	*Trip_Cargo
	//	*Trip_Passengers
	TripInfo      isTrip_TripInfo `protobuf_oneof:"tripInfo"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *Trip) Reset() {
	*x = Trip{}
	mi := &file_proto_trip_service_proto_msgTypes[2]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *Trip) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Trip) ProtoMessage() {}

func (x *Trip) ProtoReflect() protoreflect.Message {
	mi := &file_proto_trip_service_proto_msgTypes[2]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Trip.ProtoReflect.Descriptor instead.
func (*Trip) Descriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{2}
}

func (x *Trip) GetId() int32 {
	if x != nil && x.Id != nil {
		return *x.Id
	}
	return 0
}

func (x *Trip) GetRouteId() int32 {
	if x != nil && x.RouteId != nil {
		return *x.RouteId
	}
	return 0
}

func (x *Trip) GetDriverId() int32 {
	if x != nil && x.DriverId != nil {
		return *x.DriverId
	}
	return 0
}

func (x *Trip) GetTransportId() int32 {
	if x != nil && x.TransportId != nil {
		return *x.TransportId
	}
	return 0
}

func (x *Trip) GetStartTime() *timestamppb.Timestamp {
	if x != nil {
		return x.StartTime
	}
	return nil
}

func (x *Trip) GetEndTime() *timestamppb.Timestamp {
	if x != nil {
		return x.EndTime
	}
	return nil
}

func (x *Trip) GetType() string {
	if x != nil {
		return x.Type
	}
	return ""
}

func (x *Trip) GetDistance() float32 {
	if x != nil && x.Distance != nil {
		return *x.Distance
	}
	return 0
}

func (x *Trip) GetTripInfo() isTrip_TripInfo {
	if x != nil {
		return x.TripInfo
	}
	return nil
}

func (x *Trip) GetCargo() *TripInfoCargo {
	if x != nil {
		if x, ok := x.TripInfo.(*Trip_Cargo); ok {
			return x.Cargo
		}
	}
	return nil
}

func (x *Trip) GetPassengers() *TripInfoPassenger {
	if x != nil {
		if x, ok := x.TripInfo.(*Trip_Passengers); ok {
			return x.Passengers
		}
	}
	return nil
}

type isTrip_TripInfo interface {
	isTrip_TripInfo()
}

type Trip_Cargo struct {
	Cargo *TripInfoCargo `protobuf:"bytes,8,opt,name=cargo,proto3,oneof"`
}

type Trip_Passengers struct {
	Passengers *TripInfoPassenger `protobuf:"bytes,9,opt,name=passengers,proto3,oneof"`
}

func (*Trip_Cargo) isTrip_TripInfo() {}

func (*Trip_Passengers) isTrip_TripInfo() {}

type TripFilter struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	RouteId       *int32                 `protobuf:"varint,1,opt,name=routeId,proto3,oneof" json:"routeId,omitempty"`
	DriverId      *int32                 `protobuf:"varint,2,opt,name=driverId,proto3,oneof" json:"driverId,omitempty"`
	TransportId   *int32                 `protobuf:"varint,3,opt,name=transportId,proto3,oneof" json:"transportId,omitempty"`
	DateFrom      *timestamppb.Timestamp `protobuf:"bytes,4,opt,name=dateFrom,proto3,oneof" json:"dateFrom,omitempty"`
	DateTo        *timestamppb.Timestamp `protobuf:"bytes,5,opt,name=dateTo,proto3,oneof" json:"dateTo,omitempty"`
	Type          *string                `protobuf:"bytes,6,opt,name=type,proto3,oneof" json:"type,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *TripFilter) Reset() {
	*x = TripFilter{}
	mi := &file_proto_trip_service_proto_msgTypes[3]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *TripFilter) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TripFilter) ProtoMessage() {}

func (x *TripFilter) ProtoReflect() protoreflect.Message {
	mi := &file_proto_trip_service_proto_msgTypes[3]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TripFilter.ProtoReflect.Descriptor instead.
func (*TripFilter) Descriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{3}
}

func (x *TripFilter) GetRouteId() int32 {
	if x != nil && x.RouteId != nil {
		return *x.RouteId
	}
	return 0
}

func (x *TripFilter) GetDriverId() int32 {
	if x != nil && x.DriverId != nil {
		return *x.DriverId
	}
	return 0
}

func (x *TripFilter) GetTransportId() int32 {
	if x != nil && x.TransportId != nil {
		return *x.TransportId
	}
	return 0
}

func (x *TripFilter) GetDateFrom() *timestamppb.Timestamp {
	if x != nil {
		return x.DateFrom
	}
	return nil
}

func (x *TripFilter) GetDateTo() *timestamppb.Timestamp {
	if x != nil {
		return x.DateTo
	}
	return nil
}

func (x *TripFilter) GetType() string {
	if x != nil && x.Type != nil {
		return *x.Type
	}
	return ""
}

type TripList struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Trips         []*Trip                `protobuf:"bytes,1,rep,name=trips,proto3" json:"trips,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *TripList) Reset() {
	*x = TripList{}
	mi := &file_proto_trip_service_proto_msgTypes[4]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *TripList) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TripList) ProtoMessage() {}

func (x *TripList) ProtoReflect() protoreflect.Message {
	mi := &file_proto_trip_service_proto_msgTypes[4]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TripList.ProtoReflect.Descriptor instead.
func (*TripList) Descriptor() ([]byte, []int) {
	return file_proto_trip_service_proto_rawDescGZIP(), []int{4}
}

func (x *TripList) GetTrips() []*Trip {
	if x != nil {
		return x.Trips
	}
	return nil
}

var File_proto_trip_service_proto protoreflect.FileDescriptor

var file_proto_trip_service_proto_rawDesc = string([]byte{
	0x0a, 0x18, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x74, 0x72, 0x69, 0x70, 0x5f, 0x73, 0x65, 0x72,
	0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x04, 0x6d, 0x61, 0x69, 0x6e,
	0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x1a, 0x1b, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2f, 0x65, 0x6d, 0x70, 0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x9b,
	0x01, 0x0a, 0x0d, 0x54, 0x72, 0x69, 0x70, 0x49, 0x6e, 0x66, 0x6f, 0x43, 0x61, 0x72, 0x67, 0x6f,
	0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x02, 0x69, 0x64,
	0x12, 0x1c, 0x0a, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x54, 0x79, 0x70, 0x65, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x54, 0x79, 0x70, 0x65, 0x12, 0x1c,
	0x0a, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x4e, 0x61, 0x6d, 0x65, 0x12, 0x20, 0x0a, 0x0b,
	0x63, 0x61, 0x72, 0x67, 0x6f, 0x57, 0x65, 0x69, 0x67, 0x68, 0x74, 0x18, 0x04, 0x20, 0x01, 0x28,
	0x02, 0x52, 0x0b, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x57, 0x65, 0x69, 0x67, 0x68, 0x74, 0x12, 0x1c,
	0x0a, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x43, 0x6f, 0x73, 0x74, 0x18, 0x05, 0x20, 0x01, 0x28,
	0x02, 0x52, 0x09, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x43, 0x6f, 0x73, 0x74, 0x22, 0x49, 0x0a, 0x11,
	0x54, 0x72, 0x69, 0x70, 0x49, 0x6e, 0x66, 0x6f, 0x50, 0x61, 0x73, 0x73, 0x65, 0x6e, 0x67, 0x65,
	0x72, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x02, 0x69,
	0x64, 0x12, 0x24, 0x0a, 0x0d, 0x70, 0x61, 0x73, 0x73, 0x65, 0x6e, 0x67, 0x65, 0x72, 0x73, 0x4e,
	0x75, 0x6d, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x0d, 0x70, 0x61, 0x73, 0x73, 0x65, 0x6e,
	0x67, 0x65, 0x72, 0x73, 0x4e, 0x75, 0x6d, 0x22, 0xe9, 0x03, 0x0a, 0x04, 0x54, 0x72, 0x69, 0x70,
	0x12, 0x13, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x48, 0x01, 0x52, 0x02,
	0x69, 0x64, 0x88, 0x01, 0x01, 0x12, 0x1d, 0x0a, 0x07, 0x72, 0x6f, 0x75, 0x74, 0x65, 0x49, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x48, 0x02, 0x52, 0x07, 0x72, 0x6f, 0x75, 0x74, 0x65, 0x49,
	0x64, 0x88, 0x01, 0x01, 0x12, 0x1f, 0x0a, 0x08, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72, 0x49, 0x64,
	0x18, 0x03, 0x20, 0x01, 0x28, 0x05, 0x48, 0x03, 0x52, 0x08, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72,
	0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x25, 0x0a, 0x0b, 0x74, 0x72, 0x61, 0x6e, 0x73, 0x70, 0x6f,
	0x72, 0x74, 0x49, 0x64, 0x18, 0x04, 0x20, 0x01, 0x28, 0x05, 0x48, 0x04, 0x52, 0x0b, 0x74, 0x72,
	0x61, 0x6e, 0x73, 0x70, 0x6f, 0x72, 0x74, 0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x38, 0x0a, 0x09,
	0x73, 0x74, 0x61, 0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x09, 0x73, 0x74, 0x61,
	0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x12, 0x39, 0x0a, 0x07, 0x65, 0x6e, 0x64, 0x54, 0x69, 0x6d,
	0x65, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x48, 0x05, 0x52, 0x07, 0x65, 0x6e, 0x64, 0x54, 0x69, 0x6d, 0x65, 0x88, 0x01,
	0x01, 0x12, 0x12, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x04, 0x74, 0x79, 0x70, 0x65, 0x12, 0x1f, 0x0a, 0x08, 0x64, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x63,
	0x65, 0x18, 0x0a, 0x20, 0x01, 0x28, 0x02, 0x48, 0x06, 0x52, 0x08, 0x64, 0x69, 0x73, 0x74, 0x61,
	0x6e, 0x63, 0x65, 0x88, 0x01, 0x01, 0x12, 0x2b, 0x0a, 0x05, 0x63, 0x61, 0x72, 0x67, 0x6f, 0x18,
	0x08, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x13, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69,
	0x70, 0x49, 0x6e, 0x66, 0x6f, 0x43, 0x61, 0x72, 0x67, 0x6f, 0x48, 0x00, 0x52, 0x05, 0x63, 0x61,
	0x72, 0x67, 0x6f, 0x12, 0x39, 0x0a, 0x0a, 0x70, 0x61, 0x73, 0x73, 0x65, 0x6e, 0x67, 0x65, 0x72,
	0x73, 0x18, 0x09, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x17, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54,
	0x72, 0x69, 0x70, 0x49, 0x6e, 0x66, 0x6f, 0x50, 0x61, 0x73, 0x73, 0x65, 0x6e, 0x67, 0x65, 0x72,
	0x48, 0x00, 0x52, 0x0a, 0x70, 0x61, 0x73, 0x73, 0x65, 0x6e, 0x67, 0x65, 0x72, 0x73, 0x42, 0x0a,
	0x0a, 0x08, 0x74, 0x72, 0x69, 0x70, 0x49, 0x6e, 0x66, 0x6f, 0x42, 0x05, 0x0a, 0x03, 0x5f, 0x69,
	0x64, 0x42, 0x0a, 0x0a, 0x08, 0x5f, 0x72, 0x6f, 0x75, 0x74, 0x65, 0x49, 0x64, 0x42, 0x0b, 0x0a,
	0x09, 0x5f, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72, 0x49, 0x64, 0x42, 0x0e, 0x0a, 0x0c, 0x5f, 0x74,
	0x72, 0x61, 0x6e, 0x73, 0x70, 0x6f, 0x72, 0x74, 0x49, 0x64, 0x42, 0x0a, 0x0a, 0x08, 0x5f, 0x65,
	0x6e, 0x64, 0x54, 0x69, 0x6d, 0x65, 0x42, 0x0b, 0x0a, 0x09, 0x5f, 0x64, 0x69, 0x73, 0x74, 0x61,
	0x6e, 0x63, 0x65, 0x22, 0xcc, 0x02, 0x0a, 0x0a, 0x54, 0x72, 0x69, 0x70, 0x46, 0x69, 0x6c, 0x74,
	0x65, 0x72, 0x12, 0x1d, 0x0a, 0x07, 0x72, 0x6f, 0x75, 0x74, 0x65, 0x49, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x05, 0x48, 0x00, 0x52, 0x07, 0x72, 0x6f, 0x75, 0x74, 0x65, 0x49, 0x64, 0x88, 0x01,
	0x01, 0x12, 0x1f, 0x0a, 0x08, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72, 0x49, 0x64, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x05, 0x48, 0x01, 0x52, 0x08, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72, 0x49, 0x64, 0x88,
	0x01, 0x01, 0x12, 0x25, 0x0a, 0x0b, 0x74, 0x72, 0x61, 0x6e, 0x73, 0x70, 0x6f, 0x72, 0x74, 0x49,
	0x64, 0x18, 0x03, 0x20, 0x01, 0x28, 0x05, 0x48, 0x02, 0x52, 0x0b, 0x74, 0x72, 0x61, 0x6e, 0x73,
	0x70, 0x6f, 0x72, 0x74, 0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x3b, 0x0a, 0x08, 0x64, 0x61, 0x74,
	0x65, 0x46, 0x72, 0x6f, 0x6d, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69,
	0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x48, 0x03, 0x52, 0x08, 0x64, 0x61, 0x74, 0x65, 0x46,
	0x72, 0x6f, 0x6d, 0x88, 0x01, 0x01, 0x12, 0x37, 0x0a, 0x06, 0x64, 0x61, 0x74, 0x65, 0x54, 0x6f,
	0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x48, 0x04, 0x52, 0x06, 0x64, 0x61, 0x74, 0x65, 0x54, 0x6f, 0x88, 0x01, 0x01, 0x12,
	0x17, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x48, 0x05, 0x52,
	0x04, 0x74, 0x79, 0x70, 0x65, 0x88, 0x01, 0x01, 0x42, 0x0a, 0x0a, 0x08, 0x5f, 0x72, 0x6f, 0x75,
	0x74, 0x65, 0x49, 0x64, 0x42, 0x0b, 0x0a, 0x09, 0x5f, 0x64, 0x72, 0x69, 0x76, 0x65, 0x72, 0x49,
	0x64, 0x42, 0x0e, 0x0a, 0x0c, 0x5f, 0x74, 0x72, 0x61, 0x6e, 0x73, 0x70, 0x6f, 0x72, 0x74, 0x49,
	0x64, 0x42, 0x0b, 0x0a, 0x09, 0x5f, 0x64, 0x61, 0x74, 0x65, 0x46, 0x72, 0x6f, 0x6d, 0x42, 0x09,
	0x0a, 0x07, 0x5f, 0x64, 0x61, 0x74, 0x65, 0x54, 0x6f, 0x42, 0x07, 0x0a, 0x05, 0x5f, 0x74, 0x79,
	0x70, 0x65, 0x22, 0x2c, 0x0a, 0x08, 0x54, 0x72, 0x69, 0x70, 0x4c, 0x69, 0x73, 0x74, 0x12, 0x20,
	0x0a, 0x05, 0x74, 0x72, 0x69, 0x70, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x0a, 0x2e,
	0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69, 0x70, 0x52, 0x05, 0x74, 0x72, 0x69, 0x70, 0x73,
	0x2a, 0x24, 0x0a, 0x08, 0x54, 0x72, 0x69, 0x70, 0x54, 0x79, 0x70, 0x65, 0x12, 0x09, 0x0a, 0x05,
	0x63, 0x61, 0x72, 0x67, 0x6f, 0x10, 0x00, 0x12, 0x0d, 0x0a, 0x09, 0x70, 0x61, 0x73, 0x73, 0x65,
	0x6e, 0x67, 0x65, 0x72, 0x10, 0x01, 0x32, 0xce, 0x01, 0x0a, 0x0c, 0x54, 0x72, 0x69, 0x70, 0x73,
	0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x26, 0x0a, 0x0a, 0x43, 0x72, 0x65, 0x61, 0x74,
	0x65, 0x54, 0x72, 0x69, 0x70, 0x12, 0x0a, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69,
	0x70, 0x1a, 0x0a, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69, 0x70, 0x22, 0x00, 0x12,
	0x37, 0x0a, 0x0b, 0x47, 0x65, 0x74, 0x41, 0x6c, 0x6c, 0x54, 0x72, 0x69, 0x70, 0x73, 0x12, 0x16,
	0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66,
	0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x0e, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72,
	0x69, 0x70, 0x4c, 0x69, 0x73, 0x74, 0x22, 0x00, 0x12, 0x25, 0x0a, 0x09, 0x41, 0x6c, 0x74, 0x65,
	0x72, 0x54, 0x72, 0x69, 0x70, 0x12, 0x0a, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69,
	0x70, 0x1a, 0x0a, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69, 0x70, 0x22, 0x00, 0x12,
	0x36, 0x0a, 0x10, 0x47, 0x65, 0x74, 0x46, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x65, 0x64, 0x54, 0x72,
	0x69, 0x70, 0x73, 0x12, 0x10, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69, 0x70, 0x46,
	0x69, 0x6c, 0x74, 0x65, 0x72, 0x1a, 0x0e, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x54, 0x72, 0x69,
	0x70, 0x4c, 0x69, 0x73, 0x74, 0x22, 0x00, 0x42, 0x03, 0x5a, 0x01, 0x2e, 0x62, 0x06, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x33,
})

var (
	file_proto_trip_service_proto_rawDescOnce sync.Once
	file_proto_trip_service_proto_rawDescData []byte
)

func file_proto_trip_service_proto_rawDescGZIP() []byte {
	file_proto_trip_service_proto_rawDescOnce.Do(func() {
		file_proto_trip_service_proto_rawDescData = protoimpl.X.CompressGZIP(unsafe.Slice(unsafe.StringData(file_proto_trip_service_proto_rawDesc), len(file_proto_trip_service_proto_rawDesc)))
	})
	return file_proto_trip_service_proto_rawDescData
}

var file_proto_trip_service_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_proto_trip_service_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_proto_trip_service_proto_goTypes = []any{
	(TripType)(0),                 // 0: main.TripType
	(*TripInfoCargo)(nil),         // 1: main.TripInfoCargo
	(*TripInfoPassenger)(nil),     // 2: main.TripInfoPassenger
	(*Trip)(nil),                  // 3: main.Trip
	(*TripFilter)(nil),            // 4: main.TripFilter
	(*TripList)(nil),              // 5: main.TripList
	(*timestamppb.Timestamp)(nil), // 6: google.protobuf.Timestamp
	(*emptypb.Empty)(nil),         // 7: google.protobuf.Empty
}
var file_proto_trip_service_proto_depIdxs = []int32{
	6,  // 0: main.Trip.startTime:type_name -> google.protobuf.Timestamp
	6,  // 1: main.Trip.endTime:type_name -> google.protobuf.Timestamp
	1,  // 2: main.Trip.cargo:type_name -> main.TripInfoCargo
	2,  // 3: main.Trip.passengers:type_name -> main.TripInfoPassenger
	6,  // 4: main.TripFilter.dateFrom:type_name -> google.protobuf.Timestamp
	6,  // 5: main.TripFilter.dateTo:type_name -> google.protobuf.Timestamp
	3,  // 6: main.TripList.trips:type_name -> main.Trip
	3,  // 7: main.TripsService.CreateTrip:input_type -> main.Trip
	7,  // 8: main.TripsService.GetAllTrips:input_type -> google.protobuf.Empty
	3,  // 9: main.TripsService.AlterTrip:input_type -> main.Trip
	4,  // 10: main.TripsService.GetFilteredTrips:input_type -> main.TripFilter
	3,  // 11: main.TripsService.CreateTrip:output_type -> main.Trip
	5,  // 12: main.TripsService.GetAllTrips:output_type -> main.TripList
	3,  // 13: main.TripsService.AlterTrip:output_type -> main.Trip
	5,  // 14: main.TripsService.GetFilteredTrips:output_type -> main.TripList
	11, // [11:15] is the sub-list for method output_type
	7,  // [7:11] is the sub-list for method input_type
	7,  // [7:7] is the sub-list for extension type_name
	7,  // [7:7] is the sub-list for extension extendee
	0,  // [0:7] is the sub-list for field type_name
}

func init() { file_proto_trip_service_proto_init() }
func file_proto_trip_service_proto_init() {
	if File_proto_trip_service_proto != nil {
		return
	}
	file_proto_trip_service_proto_msgTypes[2].OneofWrappers = []any{
		(*Trip_Cargo)(nil),
		(*Trip_Passengers)(nil),
	}
	file_proto_trip_service_proto_msgTypes[3].OneofWrappers = []any{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_proto_trip_service_proto_rawDesc), len(file_proto_trip_service_proto_rawDesc)),
			NumEnums:      1,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_proto_trip_service_proto_goTypes,
		DependencyIndexes: file_proto_trip_service_proto_depIdxs,
		EnumInfos:         file_proto_trip_service_proto_enumTypes,
		MessageInfos:      file_proto_trip_service_proto_msgTypes,
	}.Build()
	File_proto_trip_service_proto = out.File
	file_proto_trip_service_proto_goTypes = nil
	file_proto_trip_service_proto_depIdxs = nil
}
