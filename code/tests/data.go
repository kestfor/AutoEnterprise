package tests

import (
	. "AutoEnterpise/code/generated/person"
	. "AutoEnterpise/code/generated/transport"
	"google.golang.org/protobuf/types/known/timestamppb"
	"time"
)

var garage = GarageFacility{
	Name:    "test",
	Address: "test",
	Type:    GarageFacilityType_carport.String(),
}

var master = Person{
	FirstName:   "Иван",
	SecondName:  "Иванов",
	Role:        "master",
	BirthDate:   timestamppb.New(time.Date(1980, 1, 1, 0, 0, 0, 0, time.UTC)),
	PhoneNumber: "+79999999999",
	Email:       "",
	Salary:      100000,
	PersonInfo:  &Person_MasterInfo{MasterInfo: &MasterInfo{}},
}

var manager = Person{
	FirstName:   "Иван",
	SecondName:  "Иванов",
	Role:        "manager",
	BirthDate:   timestamppb.New(time.Date(1980, 1, 1, 0, 0, 0, 0, time.UTC)),
	PhoneNumber: "+79999999999",
	Email:       "",
	Salary:      100000,
	PersonInfo:  &Person_ManagerInfo{ManagerInfo: &ManagerInfo{Department: "Отдел 1", ManagementExperienceYears: 10}},
}

var driver = Person{
	FirstName:   "Петр",
	SecondName:  "Петров",
	Role:        "driver",
	BirthDate:   timestamppb.New(time.Date(1980, 1, 1, 0, 0, 0, 0, time.UTC)),
	PhoneNumber: "+79999999999",
	Email:       "test@mail.com",
	Salary:      100000,
	PersonInfo:  &Person_DriverInfo{DriverInfo: &DriverInfo{}},
}

var foreman = Person{
	FirstName:   "Иван",
	SecondName:  "Иванов",
	Role:        "foreman",
	BirthDate:   timestamppb.New(time.Date(1980, 1, 1, 0, 0, 0, 0, time.UTC)),
	PhoneNumber: "+79999999999",
	Email:       "test@mail.com",
	Salary:      100000,
	PersonInfo: &Person_ForemanInfo{ForemanInfo: &ForemanInfo{
		MasterId:      nil,
		ServiceCenter: nil,
		Certification: nil}},
}

var tram = Transport{
	Name:             "test",
	Type:             "tram",
	LicensePlate:     "A00AAA",
	GarageFacilityId: nil,
	TransportInfo:    &Transport_TramInfo{TramInfo: &TramInfo{}},
}

var bus = Transport{
	Name:             "test",
	Type:             "bus",
	LicensePlate:     "A00AAB",
	GarageFacilityId: nil,
	TransportInfo:    &Transport_BusInfo{BusInfo: &BusInfo{}},
}

var trolleybus = Transport{
	Name:             "test",
	Type:             "trolleybus",
	LicensePlate:     "A00AAC",
	GarageFacilityId: nil,
	TransportInfo:    &Transport_TrolleybusInfo{TrolleybusInfo: &TrolleybusInfo{}},
}

var truck = Transport{
	Name:             "test",
	Type:             "truck",
	LicensePlate:     "A00AAD",
	GarageFacilityId: nil,
	TransportInfo:    &Transport_TruckInfo{TruckInfo: &TruckInfo{}},
}

var taxi = Transport{
	Name:             "test",
	Type:             "taxi",
	LicensePlate:     "A00AAE",
	GarageFacilityId: nil,
	TransportInfo:    &Transport_TaxiInfo{TaxiInfo: &TaxiInfo{}},
}
