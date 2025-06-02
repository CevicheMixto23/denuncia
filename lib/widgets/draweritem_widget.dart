import 'package:flutter/material.dart';

Widget drawerItem(IconData icon, String title) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon, size: 40, color: Colors.white),
        const SizedBox(width: 15),
        Text(title, style: const TextStyle(fontSize: 20, color: Colors.white)),
      ],
    ),
    onTap: () {
      // acción según el título o ícono
    },
  );
}
