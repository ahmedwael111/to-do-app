import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

AppBar appBarWidget() {
  return AppBar(
    // shadowColor: Colors.white,
    toolbarHeight: 80,
    leading: const Icon(
      Icons.check_circle,
      color: Colors.white,
      size: 42,
    ),
    title: const Text(
      'Tasks',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    ),
    backgroundColor: kColor,
  );
}
