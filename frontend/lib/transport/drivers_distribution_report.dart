import 'package:auto_enterprise/report_service/report_service.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/material.dart';

class DriversDistributionReport extends StatefulWidget {
  const DriversDistributionReport({super.key});

  @override
  State<StatefulWidget> createState() {
    return DriversDistributionReportState();
  }
}

class DriversDistributionReportState extends State<DriversDistributionReport> {
  late final Future<Map<String, String>> futureData;

  @override
  void initState() {
    super.initState();

    ReportsProvider reportsProvider = ReportsProvider();
    futureData = reportsProvider.fetchDriversDistribution();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drivers by Transport"),
      ),
      body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              showError(context, "Something went wrong");
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
                            leading: Column(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  height: 8,
                                ),
                                Icon(Icons.directions_car)
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
