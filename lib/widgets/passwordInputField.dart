import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputField({super.key, required this.controller});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.password_sharp),
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none
        )
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
    );
  }
}