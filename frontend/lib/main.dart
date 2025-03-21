import 'package:auto_enterprise/persons/brigade/brigade_editable.dart';
import 'package:auto_enterprise/persons/brigade/brigade_screen.dart';
import 'package:auto_enterprise/persons/detailed/detailed_person.dart';
import 'package:auto_enterprise/persons/persons_screen.dart';
import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:auto_enterprise/repairs/detailed_repair.dart';
import 'package:auto_enterprise/repairs/repairs_screen.dart';
import 'package:auto_enterprise/repairs/units/detailed_unit.dart';
import 'package:auto_enterprise/repairs/units/units_creen.dart';
import 'package:auto_enterprise/routes/editable_route.dart';
import 'package:auto_enterprise/routes/route_screen.dart';
import 'package:auto_enterprise/transport/detailed/detailed_transport.dart';
import 'package:auto_enterprise/transport/garage/detailed_garage.dart';
import 'package:auto_enterprise/transport/garage/garage.dart';
import 'package:auto_enterprise/transport/transports_screen.dart';
import 'package:auto_enterprise/transport_operations/detailed.dart';
import 'package:auto_enterprise/transport_operations/operations_screen.dart';
import 'package:auto_enterprise/trips/detailed/dynamic_form.dart';
import 'package:auto_enterprise/trips/detailed/trip.dart';
import 'package:auto_enterprise/trips/trips_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData(
      //   colorScheme: const ColorScheme.dark(),
      //   applyElevationOverlayColor: true,
      //   useMaterial3: true,
      //   primarySwatch: Colors.grey,
      //   scaffoldBackgroundColor: Colors.grey[900],
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        applyElevationOverlayColor: true,
        useMaterial3: true,
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      // themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      const Text('Auto Enterprise', style: optionStyle),
      ProfilesScreen(onProfileSelected: (person, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditablePerson(person: person)),
        );
        function();
      }),
      TransportScreen(
        onTransportSelected: (transport, function) async {
          await Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => EditableTransport(transport: transport)),
          );
          function();
        },
      ),
      BrigadesScreen(onBrigadeSelected: (brigade, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditableBrigade(brigade: brigade)),
        );
        function();
      }),
      GarageScreen(onGarageSelected: (garage, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditableGarageFacility(garage: garage)),
        );
        function();
      }),
      TripsScreen(onSelected: (trip, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => TripFormStateModel(),
                    child: DynamicTripFormScreen(trip: trip),
                  )),
        );
        function();
      }),
      RouteScreen(onRouteSelected: (route, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditableRoute(route: route)),
        );
        function();
      }),
      RepairScreen(onRepairSelected: (repair, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditableRepair(repair: repair)),
        );
        function();
      }),
      OperationsScreen(onSelected: (op, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => TransportOperationEditable(operation: op)),
        );
        function();
      }),
      UnitsScreen(onSelected: (unit, function) async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EditableUnit(unit: unit)),
        );
        function();
      })
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: const Text('johndoe@example.com'),
              currentAccountPicture: avatarIcon(20, null),
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(Icons.home, 'Home', 0),
                  _buildDrawerItem(Icons.person, 'People', 1),
                  _buildDrawerItem(Icons.group, 'Brigades', 3),
                  _buildDrawerItem(Icons.emoji_transportation, 'Transport', 2),
                  _buildDrawerItem(Icons.garage, "Garages", 4),
                  _buildDrawerItem(Icons.directions_bus, "Trips", 5),
                  _buildDrawerItem(Icons.route, "Routes", 6),
                  _buildDrawerItem(Icons.car_repair, "Repairs", 7),
                  _buildDrawerItem(Icons.request_page, "Operations", 8),
                  _buildDrawerItem(Icons.home_repair_service, "Units", 9)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(icon, color: Colors.black45),
          title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          selected: _selectedIndex == index,
          selectedTileColor: Colors.black45.withOpacity(0.2),
          onTap: () => _onItemTapped(index),
        ));
  }
}
