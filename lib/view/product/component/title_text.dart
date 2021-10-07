import 'package:flutter/material.dart';
import 'package:iti_shop_app/constants/app_colors.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(text,
          style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blue)),
    );
  }
}
