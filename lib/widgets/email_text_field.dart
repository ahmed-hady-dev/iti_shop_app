import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'username must not be empty';
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText, prefixIcon: const Icon(Icons.person_outlined)),
    );
  }
}
