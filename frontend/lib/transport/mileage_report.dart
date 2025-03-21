import 'package:auto_enterprise/generated/google/protobuf/timestamp.pb.dart';
import 'package:auto_enterprise/generated/report_service.pb.dart';
import 'package:auto_enterprise/generated/transport_service.pb.dart';
import 'package:auto_enterprise/report_service/report_service.dart';
import 'package:auto_enterprise/transport/data_provider/data_provider.dart';
import 'package:auto_enterprise/transport/transport_list.dart';
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/date_picker.dart';
import '../utils/searchable_list.dart';
import '../utils/selectors/select_button.dart';

class MileageReport extends StatefulWidget {
  const MileageReport({super.key});

  @override
  MileageReportState createState() => MileageReportState();
}

class MileageReportState extends State<MileageReport> {
  final DataProvider dataProvider = DataProvider();
  final ReportsProvider reportsProvider = ReportsProvider();

  List<String> categories = ["any"] + DataProvider.getTypes();
  String category = "any";
  int? transportId;
  Timestamp? dateFrom;
  Timestamp? dateTo;

  SearchableList<Transport> transportListBuilder(List<Transport> tr) {
    return SearchableList<Transport>(
        items: tr,
        filterFunction: getFilteredTransports,
        listOfCardBuilder: (tr, additional) => Expanded(
            child: TransportListWidget(
                transports: tr,
                onTransportSelected: (transport) {
                  setState(() {
                    transportId = transport.id;
                    category = "any";
                    Navigator.pop(context);
                  });
                })));
  }

  void fetchReport() async {
    CarMileageRequest req = CarMileageRequest(dateFrom: dateFrom, dateTo: dateTo);
    if (category != "any") {
      req.category = category;
    }
    if (transportId != null) {
      req.transportId = transportId!;
    }

    print(req);

    Map<String, double> response;
    try {
      response = await reportsProvider.fetchCarMileage(req);
    } catch (e) {
      showError(context, e.toString());
      return;
    }

    if (!context.mounted) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    Navigator.pop(context);

    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text("Mileage report"),
                  ),
                  body: SingleChildScrollView(
                    child: mileageReportList(response),
                  ),
                )));

    // showDialog(
    //     context: context,
    //     builder: (context) =>
    //         AlertDialog(
    //           title: const Text("Report result"),
    //           content: Text("mileage: ${response.mileage}"),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop(); // Закрыть диалог
    //               },
    //               child: const Text("OK"),
    //             ),
    //           ],
    //         )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Car Mileage Report"),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomCategorySelector(
                  label: Text("category"),
                  categories: categories,
                  onTap: (c) {
                    setState(() {
                      category = c;
                      transportId = null;
                    });
                  },
                  currentCategory: category),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: SelectButton<Transport>(
                    label: 'Transport ID: ${transportId?? "any"}',
                    searchableListBuilder: transportListBuilder,
                    fetchFunction: dataProvider.fetchTransports,
                    onSelected: (Transport t) {
                      setState(() {
                        transportId = t.id;
                        category = "any";
                      });
                    },
                  )),
              SizedBox(
                height: 16,
              ),
              Row(children: [
                BottomDatePicker(
                    label: const Text("date from"),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    child: Text(dateFrom == null ? "any" : getDateTime(dateFrom!.toDateTime())),
                    onPicked: (date) {
                      setState(() {
                        dateFrom = Timestamp.fromDateTime(date);
                      });
                    }),
                const SizedBox(width: 16),
                BottomDatePicker(
                    label: const Text("date to"),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    child: Text(dateTo == null ? "any" : getDateTime(dateTo!.toDateTime())),
                    onPicked: (date) {
                      setState(() {
                        dateTo = Timestamp.fromDateTime(date);
                      });
                    }),
              ]),
              SizedBox(
                height: 16,
              ),
              OutlinedButton(onPressed: fetchReport, child: Text("Fetch report"))
            ],
          ),
        )));
  }
}

Widget mileageReportList(Map<String, double> data) {
  print(data);
  if (data.isEmpty) {
    return Center(child: Text("No data for this parameters"));
  }
  return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
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
                      Icon(Icons.straighten)
                    ],
                  ),
                  title: Text(key),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(), // Добавляем разделитель
                      Text("${data[key]}km"),
                    ],
                  ),
                ));
              })));
}
