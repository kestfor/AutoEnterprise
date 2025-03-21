import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../persons/data_provider/data_provider.dart';

class EditableUnit extends StatefulWidget {
  late final TransportUnit unit;

  EditableUnit({Key? key, TransportUnit? unit}) : super(key: key) {
    if (unit == null) {
      this.unit = TransportUnit();
    } else {
      this.unit = unit;
    }
  }

  @override
  _EditableUnitState createState() => _EditableUnitState();
}

class _EditableUnitState extends State<EditableUnit> {
  final DataProvider dataProvider = DataProvider();
  late TextEditingController idController =
  TextEditingController(text: widget.unit.hasId() ? widget.unit.id.toString() : "null");
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController typeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.unit.name);
    descriptionController = TextEditingController(text: widget.unit.description);
    typeController = TextEditingController(text: widget.unit.type);
  }

  void saveChanges() async {
    widget.unit
      ..name = nameController.text
      ..description = descriptionController.text
      ..type = typeController.text;

    TransportUnit? newUnit;
    bool saved = await saveChangesWrapper(context, () {
      if (widget.unit.hasId()) {
        dataProvider.updateTransportUnit(widget.unit);
      } else {
        dataProvider.createTransportUnit(widget.unit);
        newUnit = widget.unit;
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newUnit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit unit')),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                        enabled: false,
                        controller: idController,
                        decoration: const InputDecoration(
                          labelText: 'ID',
                          border: OutlineInputBorder(),
                        )),
                    SizedBox(height: 16),
                    defaultTextField(nameController, "name", expanded: false),
                    SizedBox(height: 16),
                    defaultTextField(typeController, "type", expanded: false),
                    SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 7,
                    ),
                    SizedBox(height: 24),
                    saveButton(saveChanges)
                  ],
                ))));
  }
}
