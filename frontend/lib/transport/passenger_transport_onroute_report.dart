import 'package:auto_enterprise/report_service/report_service.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/material.dart';

class PassengerTransportDistributionOnRouteReport extends StatefulWidget {
  const PassengerTransportDistributionOnRouteReport({super.key});

  @override
  State<StatefulWidget> createState() {
    return PassengerTransportDistributionOnRouteReportState();
  }
}

class PassengerTransportDistributionOnRouteReportState extends State<PassengerTransportDistributionOnRouteReport> {
  late final Future<Map<String, String>> futureData;

  @override
  void initState() {
    super.initState();

    ReportsProvider reportsProvider = ReportsProvider();
    futureData = reportsProvider.fetchPassengerTransportDistribution();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("transport on routes"),
      ),
      body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              showError(context, "Something went wrong, try later");
              return const Center();
            }

            final data = snapshot.data!;
            return Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          String key = data.keys.elementAt(index);
                          return Card(
                              child: ListTile(
                                leading: const Column(
                                  children: [
                                    Icon(Icons.directions_car),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Icon(Icons.route)
                                  ],
                                ),
                                title: Text(key),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(), // Добавляем разделитель
                                    Text("${data[key]}"),
                                  ],
                                ),
                              ));
                        })));
          }),
    );
  }
}
