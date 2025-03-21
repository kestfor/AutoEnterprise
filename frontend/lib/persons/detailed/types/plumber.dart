import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/picker.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/utils.dart';

class EditablePlumber extends StatefulWidget {
  final PlumberInfo plumberInfo;
  final Function() savePersonChanges;

  EditablePlumber({super.key, required this.plumberInfo, required this.savePersonChanges});

  @override
  _EditablePlumberState createState() => _EditablePlumberState();
}

class _EditablePlumberState extends State<EditablePlumber> {
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  late bool safetyTraining = false;

  PlumberInfo get plumberInfo => widget.plumberInfo;

  @override
  void initState() {
    if (plumberInfo.hasSafetyTraining()) {
      safetyTraining = plumberInfo.safetyTraining;
    }
    specializationController.text = plumberInfo.specialization.toString();
    certificationController.text = plumberInfo.certification.toString();
    super.initState();
  }

  void saveChanges() {
    setState(() {
      plumberInfo.certification = certificationController.text;
      plumberInfo.specialization = specializationController.text;
      widget.savePersonChanges();
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        defaultTextField(certificationController, 'certification', expanded: false),
        const SizedBox(height: 16),
        defaultTextField(specializationController, 'specialization', expanded: false),
        const SizedBox(height: 16),
        checkboxTile((isChecked) => setState(() => safetyTraining = isChecked), safetyTraining, 'safety training'),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
