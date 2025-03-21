import 'dart:developer';

import 'package:auto_enterprise/generated/person_service.pb.dart';
import 'package:auto_enterprise/persons/detailed/types/assembler.dart';
import 'package:auto_enterprise/persons/detailed/types/driver.dart';
import 'package:auto_enterprise/persons/detailed/types/foreman.dart';
import 'package:auto_enterprise/persons/detailed/types/manager.dart';
import 'package:auto_enterprise/persons/detailed/types/master.dart';
import 'package:auto_enterprise/persons/detailed/types/plumber.dart';
import 'package:auto_enterprise/persons/detailed/types/technician.dart';
import 'package:auto_enterprise/persons/detailed/types/welder.dart';
import 'package:flutter/material.dart';

class EmptyEditableAdditionalInfo extends StatelessWidget {
  final VoidCallback saveChanges;

  const EmptyEditableAdditionalInfo({super.key, required this.saveChanges});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: ElevatedButton(onPressed: saveChanges, child: const Text('Save Changes')));
  }
}

final Map<String, Widget Function(Person, VoidCallback)> mapping = {
  Role.driver.name: (Person person, VoidCallback onSave) =>
      EditableDriver(driverInfo: person.driverInfo, savePersonChanges: onSave),
  Role.manager.name: (Person person, VoidCallback onSave) =>
      EditableManager(managerInfo: person.managerInfo, savePersonChanges: onSave),
  Role.foreman.name: (Person person, VoidCallback onSave) =>
      EditableForeman(foremanInfo: person.foremanInfo, savePersonChanges: onSave),
  Role.master.name: (Person person, VoidCallback onSave) =>
      EditableMaster(masterInfo: person.masterInfo, savePersonChanges: onSave),

  Role.welder.name: (Person person, VoidCallback onSave) =>
      EditableWelder(welderInfo: person.welderInfo, savePersonChanges: onSave),
  Role.assembler.name: (Person person, VoidCallback onSave) =>
      EditableAssembler(assemblerInfo: person.assemblerInfo, savePersonChanges: onSave),
  Role.technician.name: (Person person, VoidCallback onSave) =>
      EditableTechnician(technicianInfo: person.technicianInfo, savePersonChanges: onSave),
  Role.plumber.name: (Person person, VoidCallback onSave) =>
      EditablePlumber(plumberInfo: person.plumberInfo, savePersonChanges: onSave),
};

Widget additionalInfoWidget(Person person, VoidCallback onSave) {
  final widgetBuilder = mapping[person.role];
  if (widgetBuilder == null) {
    log("No mapping found for role ${person.role}");
    return EmptyEditableAdditionalInfo(saveChanges: onSave);
  }
  return widgetBuilder(person, onSave);
}
