import 'package:auto_enterprise/generated/google/protobuf/timestamp.pb.dart';
import 'package:auto_enterprise/trips/detailed/passengers_trip.dart';
import 'package:auto_enterprise/utils/bottom_category_selector.dart';
import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/date_picker.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/person_service.pb.dart';
import '../../../generated/transport_service.pb.dart' as ts;
import '../../../generated/transport_service.pb.dart';
import '../../../generated/trip_service.pb.dart';
import '../../../persons/data_provider/data_provider.dart' as persons_prov;
import '../../../transport/data_provider/data_provider.dart' as transport_prov;
import '../../../utils/notifications/notification.dart';
import '../../../utils/selectors/selectors.dart';
import '../../transport/detailed/utils/validate_inputer.dart';
import '../../utils/stringer.dart';
import '../data_provider/data_provider.dart' as trips_prov;
import 'cargo_trip.dart';

class TripFormStateModel with ChangeNotifier {
  late Widget _currentForm;
  bool set = false;

  Widget get currentForm => _currentForm;

  TripFormStateModel() {
    _currentForm = const SizedBox(); // Добавляем начальное значение
  }

  void switchForm(Widget newForm) {
    set = true;
    _currentForm = newForm;
    notifyListeners();
  }
}

class TripEditable extends StatefulWidget {
  late final Trip trip;
  late final Trip savedTrip;

  TripEditable(Trip? trip, {super.key}) {
    if (trip == null) {
      this.trip = Trip(type: "passenger")..passengers = TripInfoPassenger();
    } else {
      this.trip = trip;
    }
    savedTrip = this.trip.clone();
  }

  @override
  TripEditableState createState() => TripEditableState();
}

class TripEditableState extends State<TripEditable> {
  Map<Type, dynamic> detailedData = {};

  final trips_prov.DataProvider tripsData = trips_prov.DataProvider();
  final transport_prov.DataProvider transportData = transport_prov.DataProvider();
  final persons_prov.DataProvider personsData = persons_prov.DataProvider();

  late TextEditingController distance =
      TextEditingController(text: widget.trip.hasDistance() ? widget.trip.distance.toString() : "");

  late TextEditingController idController =
      TextEditingController(text: widget.trip.hasId() ? widget.trip.id.toString() : "null");

  late int? driverId = widget.trip.hasDriverId() ? widget.trip.driverId : null;
  late int? transportId = widget.trip.hasTransportId() ? widget.trip.transportId : null;
  late int? routeId = widget.trip.hasRouteId() ? widget.trip.routeId : null;

  late Timestamp startTime = widget.trip.startTime;
  late Timestamp? endTime = widget.trip.endTime;
  late String type = widget.trip.type;
  late Widget additionalInfo = const SizedBox();

  final distanceKey = GlobalKey<FormFieldState>();

  Widget getDefaultAdditionalInfo() {
    return additionalInfo;
  }

  @override
  void initState() {
    super.initState();
    DetailedDataReceiver receiver = DetailedDataReceiver();
    print(widget.trip.transportId);

    Map<Type, int> itemsToReceive = {
      Transport: widget.trip.transportId,
      ts.Route: widget.trip.routeId,
      Person: widget.trip.driverId
    };
    receiver.receiveMany(itemsToReceive).then((value) {
      setState(() {
        detailedData = value;
      });
    });
  }

  void rollbackChanges() {
    widget.trip = widget.savedTrip.clone();
    setState(() {});
  }

  Widget routeSelectorButton(BuildContext context, dataProvider, Function? onSelected) {
    return SizedBox(
      width: double.infinity,
      child: CustomOutlinedButton(
        onPressed: () {
          selectRoute(context, dataProvider, onSelected);
        },
        onLongPress: () {
          pushDetailedRoute<ts.Route>(context, routeId ?? 0);
        },
        label: "route",
        text: Stringer(detailedData[ts.Route]).toString(),
      ),
    );
  }

  void saveChanges() async {
    if (!distanceKey.currentState!.validate()) {
      return;
    }

    if (endTime != null && startTime.toDateTime().isAfter(endTime!.toDateTime())) {
      showError(context, "Start time can't be after end time");
      return;
    }

    widget.trip.startTime = startTime;

    if (endTime != null) {
      widget.trip.endTime = endTime!;
    }

    if (driverId != null) {
      widget.trip.driverId = driverId!;
    } else {
      showError(context, "driver not selected");
      return;
    }

    if (transportId != null) {
      widget.trip.transportId = transportId!;
    } else {
      showError(context, "transport not selected");
      return;
    }

    if (routeId != null) {
      widget.trip.routeId = routeId!;
    } else {
      showError(context, "route not selected");
      return;
    }

    widget.trip.distance = double.parse(distance.text);

    Trip? newTrip;
    bool saved = await saveChangesWrapper(context, () async {
      if (widget.trip.hasId()) {
        await tripsData.updateTrip(widget.trip);
      } else {
        await tripsData.createTrip(widget.trip);
        newTrip = widget.trip;
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newTrip);
  }

  void switchForm(String category) {
    print(category);
    final formState = Provider.of<TripFormStateModel>(context, listen: false);
    setState(() {
      type = category;

      if (type == "cargo") {
        widget.trip.cargo = TripInfoCargo();
        widget.trip.type = "cargo";
        formState.switchForm(CargoTripEditable(widget.trip));
      } else {
        widget.trip.passengers = TripInfoPassenger();
        widget.trip.type = "passenger";
        formState.switchForm(PassengersTripEditable(widget.trip));
      }
    });
    print(type);
  }

  @override
  Widget build(BuildContext context) {
    print(Stringer(detailedData[Transport]).toString());
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "id",
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TransportSelectorButton(transportId, transportData, (Transport transport) {
                  setState(
                    () {
                      detailedData[Transport] = transport;
                      detailedData.remove(Person);
                      transportId = transport.id;
                      driverId = null;
                    },
                  );
                }, text: Stringer(detailedData[Transport]).toString()),
                const SizedBox(width: 16),
                driverSelectorButton(context, driverId, transportId, personsData, (Person person) {
                  setState(() {
                    driverId = person.id;
                    if (person.driverInfo.hasTransportId()) {
                      transportId = person.driverInfo.transportId;
                      detailedData[Person] = person;
                    } else {
                      showError(context, "этот водитель не имеет транспорта");
                      transportId = null;
                      detailedData.remove(Person);
                    }
                  });
                }, detailedData: detailedData)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                BottomDatePicker(
                    label: const Text("start time"),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    child: Text(startTime == null ? "any" : getDateTime(startTime.toDateTime())),
                    onPicked: (date) {
                      setState(() {
                        startTime = Timestamp.fromDateTime(date);
                      });
                    }),
                const SizedBox(width: 16),
                BottomDatePicker(
                    label: const Text("end time"),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    child: Text(endTime == null ? "any" : getDateTime(endTime!.toDateTime())),
                    onPicked: (date) {
                      setState(() {
                        endTime = Timestamp.fromDateTime(date);
                      });
                    }),
              ],
            ),
            const SizedBox(height: 16),
            BottomCategorySelector(
              categories: trips_prov.DataProvider.getTypes(),
              currentCategory: type,
              onTap: (String category) {
                setState(() {
                  switchForm(category);
                });
              },
            ),
            const SizedBox(height: 16),
            routeSelectorButton(context, transportData, (ts.Route route) {
              setState(() {
                detailedData[ts.Route] = route;
                routeId = route.id;
              });
            }),
            const SizedBox(height: 16),
            getDefaultAdditionalInfo(),
            const SizedBox(height: 16),
            SizedBox(
                child: TextValidatorInput(
              fieldKey: distanceKey,
              controller: distance,
              label: "distance",
              rule: RegexPattern.floatNumber.regex,
            )),
            const SizedBox(height: 16),
            saveButton(saveChanges)
          ],
        ),
      )),
    );
    ;
  }
}
