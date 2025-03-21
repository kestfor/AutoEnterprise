import "package:auto_enterprise/persons/data_provider/data_provider.dart" as pp;
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../generated/person_service.pb.dart';
import '../../../utils/utils.dart';

class EditableWelder extends StatefulWidget {
  final WelderInfo welderInfo;
  final Function() savePersonChanges;

  EditableWelder({super.key, required this.welderInfo, required this.savePersonChanges});

  @override
  _EditableWelderState createState() => _EditableWelderState();
}

class _EditableWelderState extends State<EditableWelder> {
  final TextEditingController weldingType = TextEditingController();
  final TextEditingController certification = TextEditingController();
  late bool safetyTraining = false;
  final pp.DataProvider personProvider = pp.DataProvider();

  WelderInfo get welderInfo => widget.welderInfo;

  @override
  void initState() {
    weldingType.text = welderInfo.weldingType;
    certification.text = welderInfo.certification;
    safetyTraining = welderInfo.hasSafetyTraining() ? welderInfo.safetyTraining : false;
    super.initState();
  }

  void saveChanges() {
    setState(() {
      welderInfo.weldingType = weldingType.text;
      welderInfo.certification = certification.text;
      welderInfo.safetyTraining = safetyTraining;
      widget.savePersonChanges();
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        defaultTextField(certification, 'certification', expanded: false),
        const SizedBox(height: 16),
        defaultTextField(weldingType, 'welding type', expanded: false),
        const SizedBox(height: 16),
        checkboxTile((isChecked) => setState(() => safetyTraining = isChecked), safetyTraining, 'safety training'),
        const SizedBox(height: 16),
        saveButton(saveChanges)
      ],
    );
  }
}
