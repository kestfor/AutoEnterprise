import "package:auto_enterprise/generated/transport_service.pb.dart" as ts;
import "package:auto_enterprise/transport/data_provider/data_provider.dart" as tdp;
import 'package:auto_enterprise/transport/transport_list.dart';
import 'package:auto_enterprise/transport/transports_screen.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/transport_service.pb.dart';
import '../utils/notifications/notification.dart';
import '../utils/searchable_list.dart';

class EditableRoute extends StatefulWidget {
  late final ts.Route route;

  EditableRoute({route, super.key}) {
    this.route = route ?? ts.Route();
  }

  @override
  _EditableRouteState createState() => _EditableRouteState();
}

class _EditableRouteState extends State<EditableRoute> {
  List<ts.Transport> newTransport = [];
  late TextEditingController idController =
      TextEditingController(text: widget.route.hasId() ? widget.route.id.toString() : "null");
  late TextEditingController nameController =
      TextEditingController(text: widget.route.hasName() ? widget.route.name : "");

  final tdp.DataProvider dataProvider = tdp.DataProvider();

  void viewTransport(context, tdp.DataProvider dataProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Transport> transport = [];

    if (!widget.route.hasId()) {
      return;
    }

    try {
      transport = await dataProvider.fetchTransportByRoute(widget.route.id);
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return TransportSelector(
          transport: transport,
          route: widget.route,
          onTransportSelected: (transport) {
            newTransport.add(transport);
          });
    }));
  }

  Widget viewTransportButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          viewTransport(context, dataProvider);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary, // Цвет темы для кнопки
          foregroundColor: Theme.of(context).colorScheme.onPrimary, // Цвет текста на кнопке
        ),
        child: Text(
          "Transport in Route",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void saveChanges() async {
    widget.route.name = nameController.text;

    ts.Route? newRoute;
    bool saved = await saveChangesWrapper(context, () async {
      if (widget.route.hasId()) {
        await dataProvider.updateRoute(widget.route);
      } else {
        await dataProvider.createRoute(widget.route);
        newRoute = widget.route;
      }

      List<int> ids = newTransport.map((e) => e.id).toList();
      await dataProvider.addTransportsToRoute(ids, widget.route.id);
    });

    if (!saved) {
      return;
    }

    for (var tr in newTransport) {
      widget.route.transport.add(tr);
    }

    Navigator.pop(context, newRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Route"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              enabled: false,
              controller: idController,
              decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface), // Цвет текста
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline), // Цвет рамки
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), // Цвет рамки при фокусе
                  )),
            ),
            SizedBox(height: 16),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface), // Цвет текста
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline), // Цвет рамки
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), // Цвет рамки при фокусе
                  ),
                )),
            SizedBox(height: 16),
            viewTransportButton(),
            SizedBox(height: 16),
            saveButton(saveChanges),
          ],
        ),
      ),
    );
  }
}

class TransportSelector extends StatefulWidget {
  final ts.Route route;
  final List<Transport> transport;
  List<Transport> selected = [];
  final Function? onTransportSelected;

  TransportSelector({Key? key, required this.transport, this.onTransportSelected, required this.route})
      : super(key: key);

  @override
  _TransportSelectorState createState() => _TransportSelectorState();
}

class _TransportSelectorState extends State<TransportSelector> {
  addTransport(List<Transport> oldTransports) async {
    Transport? newTransport = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Select Transport')),
              body: TransportScreen(onTransportSelected: (transport, _) {
                Navigator.pop(context, transport);
              })),
        ));
    if (newTransport != null) {
      if (!context.mounted) {
        return;
      }

      bool contains = () {
        for (var transport in oldTransports) {
          if (transport.id == newTransport.id) {
            return true;
          }
        }
        return false;
      }();
      if (contains) {
        showMessage(context, "Transport already in route");
        return;
      } else {
        setState(() {
          widget.selected.add(newTransport);
          if (widget.onTransportSelected != null) {
            widget.onTransportSelected!(newTransport);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await addTransport(widget.route.transport);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('Transport in route')),
        body: SearchableList<Transport>(
          items: widget.route.transport + widget.selected,
          listOfCardBuilder: (List<Transport> transport, Function? additional) {
            return TransportListWidget(
              transports: transport,
            );
          },
          categories: tdp.DataProvider.getTypes(),
          filterFunction: getFilteredTransports,
          categoryFilterFunction: getTransportsByCategory,
        ));
  }
}
