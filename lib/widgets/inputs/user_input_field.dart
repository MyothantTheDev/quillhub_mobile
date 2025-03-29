import 'package:flutter/material.dart';

class UserInputField extends StatelessWidget {
  final TextEditingController controller;
  final BoxDecoration decoration;

  const UserInputField({super.key, required this.controller, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'User Name',
          prefixIcon: Icon(Icons.person_outline),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
