import 'package:auto_enterprise/generated/google/protobuf/empty.pb.dart';
import 'package:auto_enterprise/generated/report_service.pbgrpc.dart';
import "package:auto_enterprise/utils/data_address.dart" as data_address;
import 'package:grpc/grpc.dart' as grpc;

class ReportsProvider {
  late final ReportServiceClient client;
  final port = data_address.port;
  final localhost = data_address.host;

  ReportsProvider() {
    final channel = grpc.ClientChannel(
      localhost,
      port: port,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );
    client = ReportServiceClient(channel);
  }

  Future<Map<String, double>> fetchCarMileage(CarMileageRequest request) async {
    final res = await client.getCarMileage(request);
    return res.carMileage;
  }

  Future<List<RepairCost>> fetchRepairCost(RepairCostRequest request) async {
    final res = await client.getRepairCost(request);
    return res.costs;
  }

  Future<Map<String, String>> fetchTransportByGarageDistribution() async {
    final res = await client.getTransportByGarageDistribution(Empty());
    return res.mapping;
  }


  Future<List<Subordination>> fetchSubordination({SubordinationRequest_Filter? filter}) async {
    final res = await client.getSubordination(SubordinationRequest(filter: filter));
    return res.subordinations;
  }

  Future<Map<String, String>> fetchDriversDistribution() async {
    final res = await client.getDriversDistribution(Empty());
    return res.driversDistribution;
  }

  Future<Map<String, String>> fetchPassengerTransportDistribution() async {

    final res = await client.getPassengerTransportDistribution(Empty());
    return res.passengerTransportDistribution;
  }
}
