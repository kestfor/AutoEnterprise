import '../../generated/transport_service.pb.dart';

class TransportWrapper {
  final Transport transport;

  TransportWrapper(this.transport);


  static TransportType? typeFromString(String type) {
    try {
      return TransportType.values.firstWhere((e) => e.toString().split(' ').join(" ").toLowerCase() == type.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  void setType(TransportType type) {
    transport.type = type.name;
    switch (type) {
     case TransportType.bus:
       transport.busInfo = BusInfo();;
       break;
      case TransportType.taxi:
        transport.taxiInfo = TaxiInfo();
        break;
        case TransportType.truck:
        transport.truckInfo = TruckInfo();
        break;
      case TransportType.tram:
        transport.tramInfo = TramInfo();
        break;
      case TransportType.trolleybus:
        transport.trolleybusInfo = TrolleybusInfo();
        break;
      default:
        break;

    }
  }

}
