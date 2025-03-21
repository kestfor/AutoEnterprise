import 'package:flutter/material.dart';

Widget avatarIcon(double size, String? photoUrl) {
  if (photoUrl == null) {
    return CircleAvatar(
      radius: size,
      child: Icon(Icons.person, size: size),
    );
  } else {
    return CircleAvatar(
      backgroundImage: NetworkImage(photoUrl),
      radius: size,
    );
  }
}

Widget garageIcon(double size, String? photoUrl) {
  if (photoUrl == null) {
    return CircleAvatar(
      radius: size,
      child: Icon(Icons.garage, size: size),
    );
  } else {
    return CircleAvatar(
      backgroundImage: NetworkImage(photoUrl),
      radius: size,
    );
  }
}

Widget transportIcon(double size, String? photoUrl) {
  if (photoUrl == null) {
    return CircleAvatar(
      radius: size,
      child: Icon(Icons.directions_car, size: size),
    );
  } else {
    return CircleAvatar(
      backgroundImage: NetworkImage(photoUrl),
      radius: size,
    );
  }
}

Widget searchWidget(onChanged) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: const InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: onChanged,
    ),
  );
}
