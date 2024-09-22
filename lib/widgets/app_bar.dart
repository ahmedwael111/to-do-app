import 'package:flutter/material.dart';

AppBar appBarWidget() {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.only(left: 14, bottom: 3),
      child: Icon(
        Icons.playlist_add_check_circle_sharp,
        color: Colors.white,
        size: 40,
      ),
    ),
    title: const Text(
      'Tasks',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    ),
    backgroundColor: Colors.transparent,
  );
}
