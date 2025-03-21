import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/report_service/report_service.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:auto_enterprise/utils/selectors/selectors.dart';
import 'package:flutter/material.dart';
import '../generated/person_service.pb.dart';
import '../generated/report_service.pb.dart';

class SubordinationTreeScreen extends StatefulWidget {
  const SubordinationTreeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SubordinationTreeScreenState();
}

class _SubordinationTreeScreenState extends State<SubordinationTreeScreen> {
  late Future<List<Subordination>> rootsFuture;
  final ReportsProvider reportsProvider = ReportsProvider();
  final DataProvider personsProvider = DataProvider();
  SubordinationRequest_Filter? filter;


  @override
  void initState() {
    super.initState();
    rootsFuture = reportsProvider.fetchSubordination();
  }

  void updateFilter(Person? person) {
    if (person == null) {
      return;
    }

    setState(() {
      filter = SubordinationRequest_Filter(
          personId: person.id,
          personRole: person.role
      );

      rootsFuture = reportsProvider.fetchSubordination(filter: filter);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tree"),
        actions: [
          SizedBox(child: personSelectorButton(context, personsProvider, updateFilter))
        ],
      ),
      body: FutureBuilder(
        future: rootsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            print(snapshot);
            print(snapshot.data);
            showError(context, "Something went wrong");
            return const Center();
          }

          final roots = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: roots.map((node) => _buildSubordinationTree(node, 0)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubordinationTree(Subordination node, int level) {
    return Padding(
      padding: EdgeInsets.only(left: level * 16.0, top: 8.0, bottom: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: const Icon(Icons.person),
            title: Text(
              node.personName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              node.role,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            children: node.subordinates.map((sub) => _buildSubordinationTree(sub, level + 1)).toList(),
          ),
        ),
      ),
    );
  }
}