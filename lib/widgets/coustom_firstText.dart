import 'package:flutter/material.dart';

class CoustomFirstText extends StatelessWidget {
  const CoustomFirstText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '        Press the + bottom to adding',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '     a new task !',
            style: TextStyle(fontSize: 18),
          ),
        ],
      );
  }
}


