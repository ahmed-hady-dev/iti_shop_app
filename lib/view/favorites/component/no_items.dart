import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No favorite items, go and add some!',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}
