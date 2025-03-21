import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/utils.dart';

class EditableManager extends StatefulWidget {
  final ManagerInfo managerInfo;
  final Function() savePersonChanges;

  EditableManager({super.key, required this.managerInfo, required this.savePersonChanges});

  @override
  _EditableManagerState createState() => _EditableManagerState();
}

class _EditableManagerState extends State<EditableManager> {
  final TextEditingController department = TextEditingController();
  late int experience = 1;
  final pp.DataProvider personProvider = pp.DataProvider();

  ManagerInfo get managerInfo => widget.managerInfo;

  @override
  void initState() {
    super.initState();
    department.text = managerInfo.department;
    experience = managerInfo.hasManagementExperienceYears() ? managerInfo.managementExperienceYears : 0;
  }

  void saveChanges() {
    setState(() {
      managerInfo.department = department.text;
      managerInfo.managementExperienceYears = experience;
      widget.savePersonChanges();
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: NumberPicker(
                initialValue: experience,
                minValue: 0,
                maxValue: 100,
                label: 'years of experience: ',
                onPicked: (value) {
                  setState(() {
                    experience = value;
                  });
                })),
        const SizedBox(height: 16),
        defaultTextField(department, "department", expanded: false),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
