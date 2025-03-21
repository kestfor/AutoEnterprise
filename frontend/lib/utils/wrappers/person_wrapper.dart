import '../../generated/person_service.pb.dart';

class PersonWrapper {
  final Person person;

  PersonWrapper(this.person);

  void setBrigade(Brigade brigade) {
    switch (person.whichPersonInfo()) {
      case Person_PersonInfo.driverInfo:
        person.driverInfo.brigadeId = brigade.id;
        break;
      case Person_PersonInfo.assemblerInfo:
        person.assemblerInfo.brigadeId = brigade.id;
        break;
      case Person_PersonInfo.plumberInfo:
        person.plumberInfo.brigadeId = brigade.id;
      case Person_PersonInfo.technicianInfo:
        person.technicianInfo.brigadeId = brigade.id;
      case Person_PersonInfo.welderInfo:
        person.welderInfo.brigadeId = brigade.id;
      default:
        break;
    }
  }

  static Role? roleFromString(String role) {
    try {
      return Role.values.firstWhere((e) => e.toString().split(' ').join(" ").toLowerCase() == role.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  void setRole(Role role) {
    switch (role) {
      case Role.driver:
        person.driverInfo = DriverInfo();
        break;
      case Role.foreman:
        person.foremanInfo = ForemanInfo();
        break;
      case Role.manager:
        person.managerInfo = ManagerInfo();
        break;
      case Role.master:
        person.masterInfo = MasterInfo();
        break;
      case Role.assembler:
        person.assemblerInfo = AssemblerInfo();
        break;
      case Role.welder:
        person.welderInfo = WelderInfo();
        break;
      case Role.plumber:
        person.plumberInfo = PlumberInfo();
        break;
      case Role.technician:
        person.technicianInfo = TechnicianInfo();
        break;
    }
  }
}
