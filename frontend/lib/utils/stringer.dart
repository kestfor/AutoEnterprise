import '../generated/person_service.pb.dart';
import '../generated/transport_service.pb.dart';
import '../generated/trip_service.pb.dart';

class Stringer {

  dynamic item;

  Stringer(this.item);

  @override
  String toString() {
    if (item == null) {
      return "Empty";
    }

    if (item is Transport) {
      Transport casted = item as Transport;
      return "${casted.name} ${casted.brand} ${casted.licensePlate}";
    } else if (item is Person) {
      return "${(item as Person).firstName} ${(item as Person).secondName}";
    } else if (item is Brigade) {
      return "${(item as Brigade).name}, ID: ${(item as Brigade).id}";
    } else if (item is GarageFacility) {
      return "${(item as GarageFacility).name}, ID: ${(item as GarageFacility).id}";
    } else if (item is Route) {
      return "${(item as Route).name}, ID: ${(item as Route).id}";
    } else if (item is RepairWork) {
      return (item as RepairWork).description;
    } else if (item is TransportUnit) {
      return "${(item as TransportUnit).type}: ${(item as TransportUnit).name}";
    } else if (item is Trip) {
      return "ID: ${(item as Trip).id}";
    } else {
      throw Exception("not found stringer for type $item");
    }
  }
}

