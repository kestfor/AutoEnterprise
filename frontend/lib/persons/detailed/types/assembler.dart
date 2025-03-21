import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';

class EditableAssembler extends StatefulWidget {
  final AssemblerInfo assemblerInfo;
  final Function() savePersonChanges;

  EditableAssembler({super.key, required this.assemblerInfo, required this.savePersonChanges});

  @override
  _EditableAssemblerState createState() => _EditableAssemblerState();
}

class _EditableAssemblerState extends State<EditableAssembler> {
  late int experience;
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final pp.DataProvider personProvider = pp.DataProvider();

  AssemblerInfo get assemblerInfo => widget.assemblerInfo;

  @override
  void initState() {
    experience = assemblerInfo.hasExperienceYears() ? assemblerInfo.experienceYears : 0;
    certificationController.text = assemblerInfo.certification;
    specializationController.text = assemblerInfo.specialization;
    super.initState();
  }

  void saveChanges() {
    setState(() {
      assemblerInfo.experienceYears = experience;
      assemblerInfo.certification = certificationController.text;
      assemblerInfo.specialization = specializationController.text;
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
        defaultTextField(certificationController, 'certification', expanded: false),
        const SizedBox(height: 16),
        defaultTextField(specializationController, 'specialization', expanded: false),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
