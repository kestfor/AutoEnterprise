import 'package:auto_enterprise/generated/person_service.pb.dart';
import 'package:auto_enterprise/persons/profile_card.dart';
import 'package:flutter/material.dart';

class PersonsListWidget extends StatelessWidget {
  final List<Person> persons;
  final Function? onSelected;

  const PersonsListWidget({Key? key, required this.persons, this.onSelected}) : super(key: key);

  @override
  Widget build(context) {
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
          itemCount: persons.length,
          itemBuilder: (context, index) {
            var profile = persons[index];
            return ProfileCard(
              name: '${profile.firstName} ${profile.secondName}',
              category: profile.role,
              onTap: () async {
                if (onSelected != null) {
                  onSelected!(profile);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
