import 'package:flutter/material.dart';

class DescriptionColumn extends StatelessWidget {
  const DescriptionColumn({Key? key, required this.description})
      : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Description :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )),
          const SizedBox(height: 4),
          Text(description,
              style: const TextStyle(
                fontSize: 16.0,
              ))
        ],
      ),
    );
  }
}
