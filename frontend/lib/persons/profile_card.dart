import 'package:auto_enterprise/persons/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String category;
  final String? info;
  final String? photoUrl;
  final VoidCallback? onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.category,
    this.info,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            avatarIcon(40, photoUrl),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
            Text(category, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(info ?? "", textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
            ),
          ],
        ),
      )),
    );
  }
}
