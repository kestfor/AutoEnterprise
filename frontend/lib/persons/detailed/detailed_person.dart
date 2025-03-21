import 'package:auto_enterprise/generated/google/protobuf/timestamp.pb.dart';
import 'package:auto_enterprise/generated/person_service.pb.dart';
import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/persons/detailed/additional_info_mapping.dart';
import 'package:auto_enterprise/persons/detailed/types/utils/utils.dart';
import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:auto_enterprise/transport/detailed/utils/validate_inputer.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:auto_enterprise/utils/wrappers/person_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditablePerson extends StatefulWidget {
  late Person person;
  late final Person savedPerson;

  EditablePerson({super.key, Person? person}) {
    if (person == null) {
      this.person = Person(role: DataProvider.getRoles().first)..assemblerInfo = AssemblerInfo();
    } else {
      this.person = person;
    }
    savedPerson = this.person.clone();
  }

  @override
  EditablePersonState createState() => EditablePersonState();
}

class EditablePersonState extends State<EditablePerson> {
  late DataProvider dataProvider = DataProvider();
  late TextEditingController firstNameController = TextEditingController(text: widget.person.firstName);
  late TextEditingController lastNameController = TextEditingController(text: widget.person.secondName);
  late TextEditingController phoneNumberController = TextEditingController(text: widget.person.phoneNumber);
  late TextEditingController emailController = TextEditingController(text: widget.person.email);
  late TextEditingController salaryController = TextEditingController(text: widget.person.salary.toString());
  late Timestamp birthDate;
  late String category;
  late Widget additionalInfo;

  late Map<TextEditingController, GlobalKey<FormFieldState>> keys = {
    phoneNumberController: GlobalKey<FormFieldState>(),
    emailController: GlobalKey<FormFieldState>(),
  };

  void rollbackChanges() {
    setState(() {
      widget.person = widget.savedPerson.clone();
    });
  }

  get person => widget.person;

  get savedPerson => widget.savedPerson;

  @override
  void initState() {
    super.initState();
    birthDate = widget.person.hasBirthDate() ? widget.person.birthDate : Timestamp.fromDateTime(DateTime.now());
    category = widget.person.role;
    additionalInfo = additionalInfoWidget(person, saveChanges);
  }

  bool validate() {
    bool valid = true;
    for (var key in keys.values) {
      if (!(key.currentState?.validate() ?? false)) {
        valid = false;
      }
    }

    return valid;
  }

  void saveChanges() async {
    if (!validate()) {
      return;
    }

    setState(() {
      widget.person.salary = double.parse(salaryController.text);
      widget.person.phoneNumber = phoneNumberController.text;
      widget.person.email = emailController.text;
      widget.person.birthDate = birthDate;
      widget.person.firstName = firstNameController.text;
      widget.person.secondName = lastNameController.text;
    });

    Person? newPerson;
    final saved = await saveChangesWrapper(context, () async {
      if (!widget.person.hasId()) {
        await dataProvider.createPerson(widget.person);
        newPerson = widget.person;
      } else {
        await dataProvider.updatePerson(widget.person);
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newPerson);
  }

  Widget categorySelector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: DataProvider.getRoles().map((role) {
                return ListTile(
                  title: Text(role),
                  onTap: () {
                    setState(() {
                      widget.person.role = role;
                      Role? roleT = PersonWrapper.roleFromString(role);
                      PersonWrapper(widget.person).setRole(roleT!);
                      additionalInfo = additionalInfoWidget(widget.person, saveChanges);
                      category = role;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            );
          },
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          label: const Text("role"),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(category, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget datePickWidget(context) {
    return Expanded(
        child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showModalBottomSheet(
                builder: (_) {
                  return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: CupertinoDatePicker(
                          itemExtent: 30,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (date) {
                            setState(() {
                              birthDate = Timestamp.fromDateTime(date);
                            });
                          }));
                },
                context: context,
              );

              if (pickedDate != null) {
                birthDate = Timestamp.fromDateTime(pickedDate);
              }
            },
            child: InputDecorator(
                decoration: InputDecoration(
                  label: const Text("birth date"),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                child: Text(getFormatedDate(birthDate.toDateTime())))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            avatarIcon(50, null),
            const SizedBox(height: 16),
            Row(
              children: [
                defaultTextField(firstNameController, "First name"),
                const SizedBox(width: 16),
                defaultTextField(lastNameController, "Last name")
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
                child: TextValidatorInput(
                    controller: emailController,
                    label: "email",
                    rule: RegexPattern.email.regex,
                    inputType: TextInputType.emailAddress,
                    fieldKey: keys[emailController]!)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: TextValidatorInput(
                        controller: phoneNumberController,
                        label: "phone",
                        rule: RegexPattern.ruPhone.regex,
                        inputType: TextInputType.phone,
                        fieldKey: keys[phoneNumberController]!)),
                const SizedBox(width: 16),
                datePickWidget(context)
              ],
            ),
            const SizedBox(height: 16),
            categorySelector(context),
            const SizedBox(height: 24),
            additionalInfo,
          ],
        ),
      )),
    );
  }
}
