import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final BoxDecoration decoration;

  const EmailInputField({super.key, required this.controller, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
