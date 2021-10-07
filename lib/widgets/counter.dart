// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iti_shop_app/constants/app_colors.dart';

class Counter extends StatelessWidget {
  final int value;
  final Function(int) onUpdate;
  final MainAxisSize mainAxisSize;

  const Counter(
      {Key? key,
      required this.value,
      required this.onUpdate,
      this.mainAxisSize = MainAxisSize.min})
      : super(key: key);

  _increment() {
    onUpdate(value + 1);
  }

  _decrement() {
    if (value <= 0) return;
    onUpdate(value - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.purple,
            child: IconButton(
                onPressed: value > 0 ? _decrement : null,
                icon: const Icon(Icons.remove)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              value.toString(),
              style: const TextStyle(color: AppColors.red, fontSize: 18.0),
            ),
          ),
          CircleAvatar(
              backgroundColor: AppColors.purple,
              child: IconButton(
                  onPressed: _increment, icon: const Icon(Icons.add))),
        ],
      ),
    );
  }
}
