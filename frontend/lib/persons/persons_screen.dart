import 'package:auto_enterprise/persons/data_provider/data_provider.dart';
import 'package:auto_enterprise/persons/detailed/detailed_person.dart';
import 'package:auto_enterprise/persons/profile_card.dart';
import 'package:auto_enterprise/persons/subordination_report.dart';
import 'package:auto_enterprise/utils/notifications/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/person_service.pb.dart';
import '../utils/category_button.dart';

class ProfilesScreen extends StatefulWidget {
  final Function? onProfileSelected;

  const ProfilesScreen({super.key, this.onProfileSelected});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilesScreen> {
  final dataProvider = DataProvider();
  final List<String> categories = ["All"] + DataProvider.getRoles();
  List<Person> persons = [];
  Future<List<Person>>? profilesFuture;

  String selectedCategory = 'All';
  String searchQuery = '';

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void update() {
    setState(() {});
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: updateSearchQuery,
      ),
    );
  }

  Widget listOfProfiles(List<Person> filteredProfiles) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.9,
          ),
          itemCount: filteredProfiles.length,
          itemBuilder: (context, index) {
            var profile = filteredProfiles[index];
            return ProfileCard(
                name: '${profile.firstName} ${profile.secondName}',
                category: profile.role,
                onTap: () {
                  if (widget.onProfileSelected != null) {
                    widget.onProfileSelected!(profile, update);
                  }
                });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  void fetchProfiles() async {
    profilesFuture = dataProvider.fetchPersons();
  }

  void addPerson() async {
    final newPerson = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditablePerson()),
    );
    if (newPerson != null) {
      setState(() {
        persons.add(newPerson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addPerson,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          searchWidget(),
          CategorySelector(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: updateCategory,
          ),
          SizedBox(
              height: 50,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                CategoryButton(
                  label: "subordination tree",
                  onTap: () {

                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return const SubordinationTreeScreen();
                    }));
                  },
                ),
              ])),
          FutureBuilder<List<Person>>(
              future: profilesFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  default:
                    if (snapshot.hasError || snapshot.data == null) {
                      showError(context, snapshot.error.toString());
                      return const Expanded(child: Center());
                    } else {
                      var profiles = snapshot.data!;
                      persons = profiles;
                      List<Person> filteredProfiles = persons.where((p) {
                        bool matchesCategory = selectedCategory == 'All' || p.role == selectedCategory;
                        bool matchesSearch =
                            (p.firstName + p.secondName).toLowerCase().contains(searchQuery.toLowerCase());
                        return matchesCategory && matchesSearch;
                      }).toList();
                      return listOfProfiles(filteredProfiles);
                    }
                }
              })
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: ChoiceChip(
                label:
                    Text(category, style: TextStyle(color: selectedCategory == category ? Colors.white : Colors.black)),
                selected: selectedCategory == category,
                onSelected: (selected) {
                  onCategorySelected(category);
                },
                backgroundColor: Colors.transparent,
                selectedColor: Colors.black45,
              ),
            ),
          );
        },
      ),
    );
  }
}
