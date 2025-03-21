import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/utils.dart';

class EditableTechnician extends StatefulWidget {
  final TechnicianInfo technicianInfo;
  final Function() savePersonChanges;

  EditableTechnician({super.key, required this.technicianInfo, required this.savePersonChanges});

  @override
  _EditableTechnicianState createState() => _EditableTechnicianState();
}

class _EditableTechnicianState extends State<EditableTechnician> {
  final TextEditingController fieldOfExpertiseController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();

  TechnicianInfo get technicianInfo => widget.technicianInfo;

  @override
  void initState() {
    fieldOfExpertiseController.text = technicianInfo.fieldOfExpertise.toString();
    super.initState();
  }

  void saveChanges() {
    setState(() {
      technicianInfo.certification = certificationController.text;
      technicianInfo.fieldOfExpertise = fieldOfExpertiseController.text;
      widget.savePersonChanges();
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        defaultTextField(certificationController, 'certification', expanded: false),
        const SizedBox(height: 16),
        defaultTextField(fieldOfExpertiseController, 'field of expertise', expanded: false),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
