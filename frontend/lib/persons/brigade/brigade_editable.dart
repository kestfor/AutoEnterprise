import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/persons/person_list.dart';
import 'package:auto_enterprise/utils/button.dart';
import 'package:auto_enterprise/utils/detailed_mapper.dart';
import 'package:auto_enterprise/utils/search_filters/filters.dart';
import 'package:auto_enterprise/utils/stringer.dart';
import 'package:auto_enterprise/utils/utils.dart';
import 'package:auto_enterprise/utils/wrappers/person_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/person_service.pb.dart';
import '../../utils/notifications/notification.dart';
import '../../utils/searchable_list.dart';

class EditableBrigade extends StatefulWidget {
  final Brigade emptyBrigade = Brigade();

  late Brigade brigade;
  late final Brigade savedBrigade;

  EditableBrigade({super.key, Brigade? brigade}) {
    if (brigade == null) {
      this.brigade = Brigade();
    } else {
      this.brigade = brigade;
    }
    savedBrigade = this.brigade.clone();
  }

  @override
  _EditableBrigadeState createState() => _EditableBrigadeState();
}

class _EditableBrigadeState extends State<EditableBrigade> {
  List<Person> personToSetBrigade = [];
  late TextEditingController nameController;
  late DataProvider dataProvider = DataProvider();

  Map<Type, dynamic> detailedData = {};

  void rollbackChanges() {
    setState(() {
      widget.brigade = widget.savedBrigade.clone();
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.brigade);
    nameController = TextEditingController(text: widget.brigade.name);
    DetailedDataReceiver receiver = DetailedDataReceiver();

    Map<Type, int> itemsToReceive = {Person: widget.brigade.foremanId};

    receiver.receiveMany(itemsToReceive).then((value) {
      setState(() {
        detailedData = value;
      });
    });
  }

  void saveChanges() async {
    setState(() {
      widget.brigade.name = nameController.text;
    });

    print(personToSetBrigade);
    Brigade? newBrigade;

    bool saved = await saveChangesWrapper(context, () async {
      if (!widget.brigade.hasId()) {
        await dataProvider.createBrigade(widget.brigade);
        newBrigade = widget.brigade;
      } else {
        await dataProvider.updateBrigade(widget.brigade);
      }

      if (personToSetBrigade.isNotEmpty) {
        List<Future<void>> tasks = [];
        for (var person in personToSetBrigade) {
          PersonWrapper(person).setBrigade(widget.brigade);
          tasks.add(dataProvider.updatePerson(person));
        }
        await Future.wait(tasks, eagerError: true);
      }
    });

    if (!saved) {
      return;
    }

    Navigator.pop(context, newBrigade);
  }

  void selectPerson(context, dataProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Person> persons = [];

    try {
      persons = await dataProvider.fetchPersons();
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    persons = persons.where((person) => person.role == "foreman").toList();

    Widget getPersonsCardFunction(List<Person> persons, Function? additional) {
      return PersonsListWidget(
        persons: persons,
        onSelected: (person) {
          Navigator.pop(context, person);
        },
      );
    }

    Person? person = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Select Foreman')),
          body: SearchableList<Person>(
            items: persons,
            listOfCardBuilder: getPersonsCardFunction,
            filterFunction: getFilteredPersons,
          ));
    }));
    if (person != null) {
      setState(() {
        detailedData[Person] = person;
        widget.brigade.foremanId = person.id;
      });
    }
  }

  void viewPeople(context, DataProvider dataProvide) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    var error;
    List<Person> persons = [];

    if (!widget.brigade.hasId()) {
      Navigator.pop(context);
      return;
    }

    try {
      persons = await dataProvider.fetchPersonByBrigade(widget.brigade.id);
      print(persons);
    } catch (e) {
      error = e;
    }

    if (!context.mounted) return;

    Navigator.pop(context);

    if (error != null) {
      showError(context, error.toString());
      return;
    }

    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return PeopleSelector(
          persons: persons,
          brigade: widget.brigade,
          onPersonSelected: (person) {
            setState(() {
              personToSetBrigade.add(person);
            });
          });
    }));
  }

  Widget foremanSelectorButton() {
    var id = widget.brigade.hasForemanId() ? widget.brigade.foremanId.toString() : "null";
    return SizedBox(
        width: double.infinity,
        child: CustomOutlinedButton(
            onPressed: () {
              selectPerson(context, dataProvider);
            },
            onLongPress: () {
              pushDetailedRoute<Person>(context, widget.brigade.foremanId);
            },
            label: "foreman",
            text: Stringer(detailedData[Person]).toString()));
  }

  Widget viewPeopleButton() {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            viewPeople(context, dataProvider);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("people in brigade",
              style: TextStyle(
                fontSize: 16,
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Brigade')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 18),
            foremanSelectorButton(),
            const SizedBox(height: 18),
            viewPeopleButton(),
            const SizedBox(height: 24),
            saveButton(saveChanges)
          ],
        ),
      )),
    );
  }
}

class PeopleSelector extends StatefulWidget {
  final List<Person> persons;
  late List<Person> selected = persons + [];
  final Brigade brigade;
  final Function? onPersonSelected;

  PeopleSelector({Key? key, required this.persons, this.onPersonSelected, required this.brigade}) : super(key: key);

  @override
  _PeopleSelectorState createState() => _PeopleSelectorState();
}

class _PeopleSelectorState extends State<PeopleSelector> {
  addPerson(List<Person> oldPersons) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator()),
    // );

    final items = await DataProvider().fetchServicePersonnel();

    if (!context.mounted) {
      return;
    }

    Person? newPerson = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Select Person')),
              body: SearchableList<Person>(
                items: items,
                listOfCardBuilder: (List<Person> persons, Function? additional) => PersonsListWidget(
                    persons: persons,
                    onSelected: (item) {
                      print("gere");
                      Navigator.pop(context, item);
                    }),
                filterFunction: getFilteredPersons,
                categoryFilterFunction: getPersonsByCategory,
                categories: DataProvider.getServicePersonnelRoles(),
              )),
        ));
    if (newPerson != null) {
      if (!context.mounted) {
        return;
      }

      bool contains = () {
        for (var person in oldPersons) {
          if (person.id == newPerson.id) {
            return true;
          }
        }
        return false;
      }();
      if (contains) {
        showMessage(context, "Person already in brigade");
        return;
      } else {
        setState(() {
          PersonWrapper(newPerson).setBrigade(widget.brigade);
          widget.selected.add(newPerson);
          if (widget.onPersonSelected != null) {
            widget.onPersonSelected!(newPerson);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await addPerson(widget.selected);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('People in brigade')),
        body: SearchableList<Person>(
          items: widget.selected,
          listOfCardBuilder: (List<Person> persons, Function? additional) {
            return PersonsListWidget(
              persons: persons,
            );
          },
          filterFunction: getFilteredPersons,
        ));
  }
}
