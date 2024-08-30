import 'package:flutter/material.dart';

AppBar appBarWidget() {
    return AppBar(
      title: const Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            'Tasks',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ],
      ),
      backgroundColor: Colors.red,
    );
  }

